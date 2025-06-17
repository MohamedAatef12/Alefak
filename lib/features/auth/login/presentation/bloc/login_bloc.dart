import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/auth/login/domain/usecases/login_use_case.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_events.dart';
import 'package:alefk/features/auth/login/presentation/bloc/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true;
  @override
  LoginBloc(this.loginUseCase, ) : super(LoginInitial()) {
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
          (loginResponse) {
        if (event.rememberMe) {
          DI.find<ICacheManager>().saveLogin(true);
        } else {
          DI.find<ICacheManager>().clearLogin();
        }
        emit(LoginSuccess(loginResponse.user)); // or pass token if needed
      },
    );
  }
  Future<void> _checkRemembered(
      CheckRemembered event, Emitter<LoginState> emit) async {
    final isRemembered = await DI.find<ICacheManager>().isRemembered();
    if (isRemembered) {
      final saved = DI.find<ICacheManager>().getSavedLogin();
      if (saved != null) {
        add(LoginSubmitted(model: saved, rememberMe: true));
      }
    }
  }
}