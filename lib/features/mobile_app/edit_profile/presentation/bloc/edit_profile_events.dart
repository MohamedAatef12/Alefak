import 'package:equatable/equatable.dart';

import '../../domain/entity/edit_profile_entity.dart';

abstract class EditProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickProfileImageEvent extends EditProfileEvent {
  final String base64Image;
  PickProfileImageEvent(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}

class SaveProfileChangesEvent extends EditProfileEvent {
  final EditProfileEntity entity;
  SaveProfileChangesEvent(this.entity);

  @override
  List<Object?> get props => [entity];
}
