import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/config/api/deep_handler.dart';
import 'core/config/cache_manager/cache_manager.dart';
import 'core/config/cache_manager/i_cache_manager.dart';
import 'core/config/di/di_wrapper.dart';
import 'core/config/di/injection_container.dart';
import 'core/routes/router.dart';
import 'core/themes/app_colors.dart';
import 'flavors.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set flavor globally
  F.appFlavor = flavor;

  // System UI
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Dependency Injection
  configureDependencies();
  DI.setSingleton<ICacheManager>(() => CacheManager());
  await DI.find<ICacheManager>().init();

  // Run App
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const DeepLinkHandler(
        child: MyApp(),
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

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: F.title, // Use the flavor title dynamically
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.current.primary,
      ),
      routerConfig: goRouter(),
    );
  }
}
