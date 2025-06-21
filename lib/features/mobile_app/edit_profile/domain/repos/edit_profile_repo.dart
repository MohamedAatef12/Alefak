import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/edit_profile_entity.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, void>> edit(EditProfileEntity model);
}
