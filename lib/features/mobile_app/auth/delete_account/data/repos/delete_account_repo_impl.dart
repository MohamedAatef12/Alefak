import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/delete_account_entity.dart';
import '../../domain/repos/delete_account_repo.dart';
import '../data_source/remote/delete_account_remote_data_source.dart';
import '../model/delete_account_model.dart';

@Injectable(as: DeleteAccountRepo)
class DeleteAccountRepoImpl implements DeleteAccountRepo {
  final DeleteAccountRemoteDataSource remoteDataSource;

  DeleteAccountRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> deleteAccount(DeleteAccountEntity model) async {
    final deleteAccountModel = DeleteAccountModel.fromEntity(model);
    return await remoteDataSource.deleteAccount(deleteAccountModel);
  }
}
