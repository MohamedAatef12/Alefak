import 'package:alefk/core/config/cache_manager/cache_manager.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/routes/router.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:app_links/app_links.dart';
import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/config/di/injection_container.dart';

void main() async {
  final AppLinks appLinks = AppLinks();

  void handleIncomingLinks(BuildContext context) {
    appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.pathSegments.contains('Posts')) {
        final postId = int.tryParse(uri.pathSegments.last);
        if (postId != null) {
          context.go('/post/$postId');
        }
      }
    });
  }

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  DI.setSingleton<ICacheManager>(() => CacheManager());
  await DI.find<ICacheManager>().init();
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
