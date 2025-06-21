import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';

import '../../model/edit_profile_model.dart';

abstract class EditProfileRemoteDataSource {
  Future<Either<Failure, void>> edit(EditProfileModel model);
}
