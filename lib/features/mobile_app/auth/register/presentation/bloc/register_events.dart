import '../../domain/entities/register_domain_entity.dart';

abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final RegisterEntity entity;

  RegisterSubmitted(this.entity);
}

class TogglePasswordVisibility extends RegisterEvent {}
