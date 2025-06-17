import 'package:alefk/core/config/api/api_services.dart';
import 'package:alefk/core/config/api/constants.dart';
import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/auth/delete_account/data/data_source/remote/delete_account_remote_data_source.dart';
import 'package:alefk/features/auth/delete_account/data/model/delete_account_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteAccountRemoteDataSource)
class DeleteAccountRemoteDataSourceImpl
    implements DeleteAccountRemoteDataSource {
  final ApiService apiService;
  final int id = DI.find<ICacheManager>().getUserData()!.id;
  DeleteAccountRemoteDataSourceImpl(this.apiService);

  @override
  Future<Either<Failure, void>> deleteAccount(DeleteAccountModel model) async {
    try {
      await apiService.delete(
        endPoint: '${Constants.usersEndpoint}/${id}',
    data: model.toJson(),
      );
      return const Right(null);
    } catch (e) {
      throw Exception('Error deleting account: $e');
    }
  }
}
