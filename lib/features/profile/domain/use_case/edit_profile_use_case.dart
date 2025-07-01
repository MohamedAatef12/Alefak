import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:alefk/features/profile/domain/repos/edit_profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo repository;

  EditProfileUseCase(this.repository);

  Future<Either<Failure,void>> call(EditProfileEntity entity) async {

    return await repository.edit(entity);
  }
}