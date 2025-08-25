import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../../model/delete_account_model.dart';

abstract class DeleteAccountRemoteDataSource {
  Future<Either<Failure, void>> deleteAccount(DeleteAccountModel model);
}
