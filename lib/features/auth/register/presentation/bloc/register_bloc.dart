import 'package:alefk/features/auth/register/domain/usecases/register_domain_usecase.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_events.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_registerSubmitted);
  }
  Future<void> _registerSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final result = await registerUseCase(event.entity);
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }
}