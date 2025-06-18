import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/settings/views/bloc/settings_events.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsState(
    isDark: false,
    isAccountSettingsOpen: false,
    isApplicationSettingsOpen: false,
  )) {
    on<ToggleDarkModeEvent>((event, emit) async {
      final newIsDark = !state.isDark;
      emit(state.copyWith(isDark: newIsDark));
      await DI.find<ICacheManager>().setThemeDark(newIsDark);
    });

    on<LoadPreferencesEvent>((event, emit) {
      emit(state.copyWith(isDark: event.isDark));
    });

    on<ToggleAccountSectionEvent>((event, emit) {
      emit(state.copyWith(isAccountSettingsOpen: !state.isAccountSettingsOpen));
    });

    on<ToggleApplicationSectionEvent>((event, emit) {
      emit(state.copyWith(isApplicationSettingsOpen: !state.isApplicationSettingsOpen));
    });

    _loadPreferences();
  }

  void _loadPreferences() async {
    final isDark = await DI.find<ICacheManager>().isThemeDark();
    add(LoadPreferencesEvent(isDark));
  }
}
