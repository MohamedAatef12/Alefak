import 'package:alefk/core/config/api/dio_factory.dart';
import 'package:alefk/core/config/di/injection_container.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  Dio get dio => DioFactory.getDio();
}
