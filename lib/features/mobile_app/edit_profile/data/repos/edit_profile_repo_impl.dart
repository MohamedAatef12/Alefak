import 'package:alefk/core/config/api/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/edit_profile_entity.dart';
import '../../domain/repos/edit_profile_repo.dart';
import '../data_source/remote/edit_profile_remote_data_source.dart';
import '../model/edit_profile_model.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepositoryImpl implements EditProfileRepo {
  final EditProfileRemoteDataSource remoteDataSource;

  EditProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, void>> edit(EditProfileEntity model) async {
    final editModel = EditProfileModel.fromEntity(model);
    return await remoteDataSource.edit(editModel);
  }
}
