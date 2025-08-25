import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../model/edit_profile_model.dart';
import 'edit_profile_remote_data_source.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  final ApiService apiService;

  EditProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, void>> edit(EditProfileModel model) async {
    try {
      await apiService.put(
        endPoint: '${Constants.usersEndpoint}/${model.id}',
        data: model.toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(DioFailure.fromDioError(e));
    }
  }
}
