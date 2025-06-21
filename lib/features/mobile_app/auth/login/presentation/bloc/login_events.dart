import '../../domain/entity/login_entity.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginEntity model;
  final bool rememberMe;
  LoginSubmitted({required this.model, required this.rememberMe});
}

class CheckRemembered extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}

class ToggleRememberMe extends LoginEvent {
  final bool value;
  ToggleRememberMe(this.value);
}
