import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/login/data/data_sources/remote/login_remote_data_source.dart';
import 'package:alefk/features/auth/login/data/models/login_model.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;
  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure,void>> login(LoginModel model) async {
   try {
     await apiService.post(
       endPoint: Constants.loginEndpoint,
       data: model.toJson(),

     );
     return Right(null);
   } catch(e){
      return Left(DioFailure.fromDioError(e));
   }
  }
}