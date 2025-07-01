import 'package:alefk/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:equatable/equatable.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent(); // Add const constructor

  @override
  List<Object?> get props => [];
}

class PickProfileImageEvent extends EditProfileEvent {
  final String base64Image;
  const PickProfileImageEvent(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}

class PickIdImageEvent extends EditProfileEvent {
  final String base64Image;
  const PickIdImageEvent(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}

class SaveProfileChangesEvent extends EditProfileEvent {
  final EditProfileEntity entity;
  const SaveProfileChangesEvent(this.entity);

  @override
  List<Object?> get props => [entity];
}

class ToggleProfileInfoExpansionEvent extends EditProfileEvent {
  const ToggleProfileInfoExpansionEvent();

  @override
  List<Object?> get props => [];
}
class ChangeTabEvent extends EditProfileEvent {
  final int tabIndex;
  const ChangeTabEvent(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}

class LoadTabListEvent extends EditProfileEvent {
  final int tabIndex;
  const LoadTabListEvent(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}

class LoadUserDataEvent extends EditProfileEvent {}