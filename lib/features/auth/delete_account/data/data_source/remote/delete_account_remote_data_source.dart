import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/delete_account/data/model/delete_account_model.dart';

import 'package:dartz/dartz.dart';

abstract class DeleteAccountRemoteDataSource {

  Future<Either<Failure,void>> deleteAccount(DeleteAccountModel model);
}