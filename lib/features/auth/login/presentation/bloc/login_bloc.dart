import 'package:alefk/features/auth/login/domain/usecases/login_local_use_case.dart';
import 'package:alefk/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_events.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final LoginLocalUseCase loginLocalUseCase;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true;
  @override
  LoginBloc(this.loginUseCase, this.loginLocalUseCase, ) : super(LoginInitial()) {
    on<CheckRemembered>(_checkRemembered);
    on<LoginSubmitted>(_loginSubmitted);
    on<TogglePasswordVisibility>((event, emit) {
      obscurePassword = !obscurePassword;
      emit(LoginPasswordVisibilityChanged());
    });
    on<ToggleRememberMe>((event, emit) {
      rememberMe = event.value;
      emit(LoginRememberMeChanged(rememberMe));
    });
}
  Future<void> _loginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await loginUseCase(event.model);
    result.fold(
          (failure) => emit(LoginFailure(failure.message)),
          (_)  {
        if (event.rememberMe) {
           loginLocalUseCase.saveLogin(event.model, true);
        } else {
           loginLocalUseCase.clearLogin();
        }
        emit(LoginSuccess(event.model));
      },
    );
  }
  Future<void> _checkRemembered(
      CheckRemembered event, Emitter<LoginState> emit) async {
    final isRemembered = await loginLocalUseCase.isRemembered();
    if (isRemembered) {
      final saved = await loginLocalUseCase.getSavedLogin();
      if (saved != null) {
        add(LoginSubmitted(model: saved, rememberMe: true));
      }
    }
  }
}