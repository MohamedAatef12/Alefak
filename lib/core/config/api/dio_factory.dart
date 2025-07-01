import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:ansicolor/ansicolor.dart';

class DioFactory {
  DioFactory._(); // private constructor

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      final dio = Dio();

      // إعداد الوقت المستغرق
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 30);

      _dio = dio;

      _addInterceptors();
    }

    return _dio!;
  }

  static void _addInterceptors() {
    _dio?.interceptors.addAll([
      // إضافة التوكن
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await DI.find<ICacheManager>().readSecureData('accessToken');
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          } catch (e) {
            // تجاهل الخطأ
          }
          return handler.next(options);
        },
      ),

      // إضافة اللوجز من Talker
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
          requestPen: AnsiPen()..blue(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    ]);
  }
}
