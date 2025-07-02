import 'package:alefk/core/config/cache_manager/cache_manager.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/config/notifications/notification_service.dart';
import 'package:alefk/core/routes/router.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'core/config/di/injection_container.dart';
import 'features/settings/views/bloc/settings_states.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  DI.setSingleton<ICacheManager>(() => CacheManager());
  await DI.find<ICacheManager>().init();
  final storage = FlutterSecureStorage();  try {
    await storage.write(key: "test", value: "hello");
    final value = await storage.read(key: "test");
    print("Test secure value: $value");
  } catch (e) {
    print("Secure storage error: $e");
  }
  runApp(
    BlocProvider(
      create: (_) => SettingsBloc(),
      child: DevicePreview(
        enabled: true,
        tools: const [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/translations', // <-- change the path of the translation files
            fallbackLocale: Locale('ar'),
            startLocale: Locale('en'),
            child: const MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final talker = TalkerFlutter.init();
    Bloc.observer = TalkerBlocObserver(talker: talker);
    final router = goRouter();
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        AppColors.current = state.isDark ? defaultDarkColors : defaultLightColors;

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Alefk',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: state.isDark ? Brightness.dark : Brightness.light,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.current.primary,
          ),
          routerConfig: router,
        );
      },
    );
  }
}
