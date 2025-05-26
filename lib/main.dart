import 'package:alefk/core/routes/router.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/config/di/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Alefk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.current.primary,
      ),
      routerConfig: router,
    );
  }
}
