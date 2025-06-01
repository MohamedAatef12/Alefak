import 'package:alefk/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_events.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>(_loginSubmitted);

}
  Future<void> _loginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUseCase(event.model);
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (_) => emit(LoginSuccess(event.model)),
    );
  }
}