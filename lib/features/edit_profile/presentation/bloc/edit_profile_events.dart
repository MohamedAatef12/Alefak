import 'package:alefk/features/edit_profile/domain/entity/edit_profile_entity.dart';
import 'package:equatable/equatable.dart';


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
class PickIdImageEvent extends EditProfileEvent {
  final String base64Image;
  PickIdImageEvent(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}
class SaveProfileChangesEvent extends EditProfileEvent {
  final EditProfileEntity entity;
  SaveProfileChangesEvent(this.entity);

  @override
  List<Object?> get props => [entity];
}