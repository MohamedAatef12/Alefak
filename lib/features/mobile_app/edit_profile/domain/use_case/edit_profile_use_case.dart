import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/edit_profile_entity.dart';
import '../repos/edit_profile_repo.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo repository;

  EditProfileUseCase(this.repository);

  Future<Either<Failure, void>> call(EditProfileEntity entity) async {
    return await repository.edit(entity);
  }
}
