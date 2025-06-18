abstract class SettingsEvent {}

class ToggleDarkModeEvent extends SettingsEvent {}

class LoadPreferencesEvent extends SettingsEvent {
  final bool isDark;
  LoadPreferencesEvent(this.isDark);
}

class ToggleAccountSectionEvent extends SettingsEvent {}

class ToggleApplicationSectionEvent extends SettingsEvent {}
