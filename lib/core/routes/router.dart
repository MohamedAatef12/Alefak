import 'package:alefk/features/about_us/presentation/view/about_us_screen.dart';
import 'package:alefk/features/bottom_bar/views/pages/bottom_bar_page.dart';
import 'package:alefk/features/cart/views/pages/cart_page.dart';
import 'package:alefk/features/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:alefk/features/home/views/pages/add_post_page.dart';
import 'package:alefk/features/home/views/pages/home_page.dart';
import 'package:alefk/features/privacy_and_policy/presentation/view/privacy_and_policy_screen.dart';
import 'package:alefk/features/settings/views/pages/settings_screen.dart';
import 'package:alefk/features/splash/presentation/view/splash_screen.dart';
import 'package:alefk/features/terms_and_conditions/presentation/view/terms_and_conditions_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/settings',
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
          return const SettingsScreen();
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
      GoRoute(
          path: '/edit_profile',
          name: 'edit_profile',
          builder: (context, state) {
            return const EditProfileScreen();
          }),
      GoRoute(
          path: '/about_us',
          name: 'about_us',
          builder: (context, state) {
            return const AboutUsScreen();
          }),
      GoRoute(
          path: '/terms_and_conditions',
          name: 'terms_and_conditions',
          builder: (context, state) {
            return const TermsAndConditionsScreen();
          }),
      GoRoute(
  path: '/privacy_policy',
  name: 'privacy_policy',
  builder: (context, state) {
    return const PrivacyAndPolicyScreen();
  }
      )
    ],
  );
}
