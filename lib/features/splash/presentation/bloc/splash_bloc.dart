import 'package:alefk/features/splash/presentation/bloc/splash_event.dart';
import 'package:alefk/features/splash/presentation/bloc/spalsh_states.dart';
import 'package:alefk/features/auth/login/domain/usecases/login_local_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LoginLocalUseCase loginLocalUseCase;

  SplashBloc(this.loginLocalUseCase) : super(SplashInitial()) {
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    final isRemembered = await loginLocalUseCase.isRemembered();
    if (isRemembered) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}