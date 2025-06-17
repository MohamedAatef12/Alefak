
import 'package:alefk/features/auth/register/data/models/register_model.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterModel user;
  LoginSuccess(this.user);
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