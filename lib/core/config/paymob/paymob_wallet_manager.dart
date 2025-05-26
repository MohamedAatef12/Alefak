import 'dart:developer';

import 'package:alefk/core/config/paymob/paymob_constants.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymobWalletManager {
  final _dio = Dio();

  Future<void> payWithWallet({
    required int amountInEGP,
    required String walletPhoneNumber,
  }) async {
    try {
      final amountCents = (amountInEGP * 100).toString();

      final authToken = await _getAuthToken();
      log("Auth Token Fetched ✅");

      final orderId = await _createOrder(authToken, amountCents);
      log("Order Created ✅ ID: $orderId");

      final paymentToken = await _getPaymentKey(
        authToken: authToken,
        orderId: orderId.toString(),
        amountCents: amountCents,
        phoneNumber: walletPhoneNumber,
      );
      log("Payment Key Fetched ✅: $paymentToken");

      final redirectUrl =
          await _initiateWalletPayment(paymentToken, walletPhoneNumber);
      log("Wallet Redirect URL: $redirectUrl");

      // ✅ Open the correct wallet page
      if (redirectUrl != null && redirectUrl.toString().isNotEmpty) {
        final uri = Uri.parse(redirectUrl);
        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
          throw Exception("Could not launch wallet redirect URL.");
        }
      } else {
        throw Exception("No redirect URL received from Paymob.");
      }
    } catch (e) {
      log("💥 Wallet Payment Failed");
      log(e.toString());
      rethrow;
    }
  }

  Future<String> _getAuthToken() async {
    final response = await _dio.post(
      "https://accept.paymob.com/api/auth/tokens",
      data: {
        "api_key": PaymobServices.paymobApiKey,
      },
    );
    return response.data["token"];
  }

  Future<int> _createOrder(String authToken, String amountCents) async {
    final response = await _dio.post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authToken,
        "amount_cents": amountCents,
        "delivery_needed": false,
        "items": [],
      },
    );
    return response.data["id"];
  }

  Future<String> _getPaymentKey({
    required String authToken,
    required String orderId,
    required String amountCents,
    required String phoneNumber,
  }) async {
    final response = await _dio.post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        "auth_token": authToken,
        "amount_cents": amountCents,
        "expiration": 3600,
        "order_id": orderId,
        "integration_id": PaymobServices.paymobIntegrationWalletId,
        "currency": "EGP",
        "billing_data": {
          "apartment": "NA",
          "email": "wallet_user@example.com",
          "floor": "NA",
          "first_name": "Wallet",
          "street": "NA",
          "building": "NA",
          "phone_number": phoneNumber,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "User",
          "state": "NA"
        }
      },
    );
    return response.data["token"];
  }

  Future<String?> _initiateWalletPayment(
      String paymentToken, String phoneNumber) async {
    final Response response = await _dio.post(
      "https://accept.paymob.com/api/acceptance/payments/pay",
      data: {
        "source": {
          "identifier": phoneNumber,
          "subtype": "WALLET",
        },
        "payment_token": paymentToken,
      },
    );

    log("🔁 Wallet Payment Full Response: ${response.data}");

    // ✅ Return the correct redirect URL
    return response.data["redirect_url"];
  }
}
