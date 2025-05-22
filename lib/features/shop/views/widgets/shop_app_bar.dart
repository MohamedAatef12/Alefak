import 'dart:developer';

import 'package:alefk/core/config/paymob/paymob_card_manager.dart';
import 'package:alefk/core/config/paymob/paymob_wallet_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          width: 100,
        ),
        const Spacer(),

        // /// Card Payment
        // InkWell(
        //   onTap: _payWithCard,
        //   child: Icon(Icons.credit_card),
        // ),
        // SizedBoxConstants.horizontalMedium,
        //
        // /// Wallet Payment
        // InkWell(
        //   onTap: _payWithWallet,
        //   child: Icon(Icons.account_balance_wallet),
        // ),
        // SizedBoxConstants.horizontalMedium,
      ],
    );
  }
}

/// Card Payment (existing)
Future<void> _payWithCard() async {
  final paymentKey = await PaymobCardManager().getPaymentKey(10, "EGP");
  log("Card Payment Key: $paymentKey");
  final url = Uri.parse(
      "https://accept.paymob.com/api/acceptance/iframes/920163?payment_token=$paymentKey");

  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch card iframe.');
  }
}

/// Wallet Payment (new)
Future<void> _payWithWallet() async {
  await PaymobWalletManager().payWithWallet(
    amountInEGP: 10,
    walletPhoneNumber: "01010101010",
  );
}
