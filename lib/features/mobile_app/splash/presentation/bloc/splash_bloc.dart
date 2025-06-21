import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/mobile_app/splash/presentation/bloc/spalsh_states.dart';
import 'package:alefk/features/mobile_app/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatus event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    final isRemembered = await DI.find<ICacheManager>().isRemembered();
    if (isRemembered) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}
