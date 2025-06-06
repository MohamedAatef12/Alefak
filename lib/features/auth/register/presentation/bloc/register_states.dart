// lib/features/register/presentation/bloc/register_state.dart
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}
class RegisterPasswordVisibilityChanged extends RegisterState {}