import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/features/auth/register/data/models/register_model.dart';
import 'package:alefk/features/auth/register/data/source/register_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final ApiService apiService;

  RegisterRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, void>> register(RegisterModel model) async {
    try {
      await apiService.post(
        endPoint: Constants.usersEndpoint,
        data: model.toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }
}