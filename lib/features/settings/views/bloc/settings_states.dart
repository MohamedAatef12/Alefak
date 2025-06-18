class SettingsState {
  final bool isDark;
  final bool isAccountSettingsOpen;
  final bool isApplicationSettingsOpen;

  const SettingsState({
    required this.isDark,
    required this.isAccountSettingsOpen,
    required this.isApplicationSettingsOpen,
  });

  SettingsState copyWith({
    bool? isDark,
    bool? isAccountSettingsOpen,
    bool? isApplicationSettingsOpen,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
      isAccountSettingsOpen: isAccountSettingsOpen ?? this.isAccountSettingsOpen,
      isApplicationSettingsOpen: isApplicationSettingsOpen ?? this.isApplicationSettingsOpen,
    );
  }
}
