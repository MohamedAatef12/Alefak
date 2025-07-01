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
    on<LoginSubmitted>((event, emit) async => await _loginSubmitted(event, emit));
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
      LoginSubmitted event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());

    final result = await loginUseCase(event.model);
    await result.fold(
          (failure) async {
        if (!emit.isDone) emit(LoginFailure(failure.message));
      },
          (loginResponse) async {
        if (event.rememberMe) {
          await DI.find<ICacheManager>().saveLogin(true);
        } else {
          await DI.find<ICacheManager>().clearLogin();
        }

        final token = loginResponse.token;
        final role = loginResponse.role;

        final cache = DI.find<ICacheManager>();
        await cache.writeSecureData('accessToken', token);
        await cache.writeSecureData('role', role!);

        if (!emit.isDone) emit(LoginSuccess(user: loginResponse.user, role: role));
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