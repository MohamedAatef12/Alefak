import 'package:dio/dio.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await DI.find<ICacheManager>().readSecureData('accessToken');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
