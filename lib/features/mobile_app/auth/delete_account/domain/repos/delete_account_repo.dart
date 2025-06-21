import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/delete_account_entity.dart';

abstract class DeleteAccountRepo {
  Future<Either<Failure, void>> deleteAccount(DeleteAccountEntity model);
}
