import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../register/data/models/register_model.dart';
import '../../../domain/entity/login_response_entity.dart';
import '../../models/login_model.dart';
import 'login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginModel model) async {
    try {
      final response = await apiService.post(
        endPoint: Constants.loginEndpoint,
        data: model.toJson(),
      );
      print('API message: ${response['message']}');
      if (response['message'] == 'Login successful') {
        final userJson = response['user'];
        final userModel = RegisterModel.fromJson(userJson);
        final token = response['token'] as String;
        await DI.find<ICacheManager>().setUserData(userModel);
        return Right(LoginResponseEntity(user: userModel, token: token));
      }
      return Left(Failure('Login failed'));
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }
}
