import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/edit_profile/domain/entity/edit_profile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EditProfileRepo {
  Future<Either<Failure,void>> edit(EditProfileEntity model);
}