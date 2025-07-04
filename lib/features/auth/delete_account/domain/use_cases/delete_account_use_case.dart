import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/auth/delete_account/domain/entity/delete_account_entity.dart';
import 'package:alefk/features/auth/delete_account/domain/repos/delete_account_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAccountUseCase {
  final DeleteAccountRepo repository;

  DeleteAccountUseCase(this.repository);

  Future<Either<Failure, void>> call(DeleteAccountEntity entity) async {
    return await repository.deleteAccount(entity);
  }
}