import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';

abstract class LoginEvent {}
class LoginSubmitted extends LoginEvent {
  final LoginEntity model;
  final bool rememberMe;
  LoginSubmitted({required this.model, required this.rememberMe});
}

class CheckRemembered extends LoginEvent {}