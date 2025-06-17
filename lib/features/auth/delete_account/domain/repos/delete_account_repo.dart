import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/delete_account/domain/entity/delete_account_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DeleteAccountRepo {
  Future<Either<Failure,void>> deleteAccount(DeleteAccountEntity model) ;
}