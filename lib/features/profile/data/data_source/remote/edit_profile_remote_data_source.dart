import 'package:alefk/core/config/api/failure.dart';
import 'package:alefk/features/profile/data/model/edit_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class EditProfileRemoteDataSource {
  Future<Either<Failure,void>> edit(EditProfileModel model);
}