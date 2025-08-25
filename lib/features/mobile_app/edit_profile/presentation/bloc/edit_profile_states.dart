import 'package:equatable/equatable.dart';


abstract class EditProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class ProfileImagePicked extends EditProfileState {
  final String base64Image;
  ProfileImagePicked(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}
class IdImagePicked extends EditProfileState {
  final String base64Image;
  IdImagePicked(this.base64Image);

  @override
  List<Object?> get props => [base64Image];
}
class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {}
class EditProfileFailure extends EditProfileState {
  final String message;
  EditProfileFailure(this.message);

  @override
  List<Object?> get props => [message];
}