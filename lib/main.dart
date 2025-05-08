import 'package:alefk/core/routes/router.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
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
