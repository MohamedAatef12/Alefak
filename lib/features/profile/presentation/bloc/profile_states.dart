import 'package:equatable/equatable.dart';

abstract class EditProfileState extends Equatable {
  final bool isExpanded;
  final int tabIndex;
  final List<dynamic> items;
  final dynamic userData;

  const EditProfileState({
    required this.isExpanded,
    required this.tabIndex,
    required this.items,
    this.userData,
  });

  @override
  List<Object?> get props => [isExpanded, tabIndex, items, userData];
}

class EditProfileInitial extends EditProfileState {
  const EditProfileInitial({
    super.isExpanded = false,
    super.tabIndex = 0,
    super.items = const [],
    super.userData,
  });
}

class ProfileImagePicked extends EditProfileState {
  final String base64Image;

  const ProfileImagePicked({
    required this.base64Image,
    required super.isExpanded,
    required super.tabIndex,
    required super.items,
  });

  @override
  List<Object?> get props => super.props..add(base64Image);
}

class IdImagePicked extends EditProfileState {
  final String base64Image;

  const IdImagePicked({
    required this.base64Image,
    required super.isExpanded,
    required super.tabIndex,
    required super.items,
  });

  @override
  List<Object?> get props => super.props..add(base64Image);
}

class EditProfileLoading extends EditProfileState {
  const EditProfileLoading({
    required super.isExpanded,
    required super.tabIndex,
    required super.items,
  });
}

class EditProfileSuccess extends EditProfileState {
  const EditProfileSuccess({
    required super.isExpanded,
    required super.tabIndex,
    required super.items,
  });
}

class EditProfileFailure extends EditProfileState {
  final String message;

  const EditProfileFailure({
    required this.message,
    required super.isExpanded,
    required super.tabIndex,
    required super.items,
  });

  @override
  List<Object?> get props => super.props..add(message);
}
