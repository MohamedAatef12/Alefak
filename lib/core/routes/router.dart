import 'package:alefk/features/bottom_bar/views/pages/bottom_bar_page.dart';
import 'package:alefk/features/cart/views/pages/cart_page.dart';
import 'package:alefk/features/home/views/pages/add_post_page.dart';
import 'package:alefk/features/home/views/pages/home_page.dart';
import 'package:alefk/features/settings/views/pages/settings_page.dart';
import 'package:alefk/features/splash/presentation/view/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/bottom',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/bottom',
        name: 'bottom',
        builder: (context, state) {
          return const BottomNavigationScreen();
        },
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) {
          return const SettingsPage();
        },
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) {
          return const CartPage();
        },
      ),
      GoRoute(
        path: '/add-post',
        name: 'add-post',
        builder: (context, state) {
          return const AddPostPage();
        },
      ),
      
    ],
  );
}
