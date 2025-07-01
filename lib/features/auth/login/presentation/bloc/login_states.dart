
import 'package:alefk/features/auth/register/data/models/register_model.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterModel user;
  final String role;
  LoginSuccess({required this.user, required this.role});
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
// register_states.dart
class LoginPasswordVisibilityChanged extends LoginState {}
class LoginRememberMeChanged extends LoginState {
  final bool rememberMe;
  LoginRememberMeChanged(this.rememberMe);
}