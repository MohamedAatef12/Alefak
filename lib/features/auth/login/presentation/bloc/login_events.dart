import 'package:alefk/features/auth/login/domain/entity/login_entity.dart';

abstract class LoginEvent {}
class LoginSubmitted extends LoginEvent {
  final LoginEntity model;
  LoginSubmitted({required this.model});
}