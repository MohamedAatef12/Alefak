import 'dart:developer';

import 'package:alefk/features/admin_panel/admin_home/presentation/views/admin_home_page.dart';
import 'package:alefk/features/privacy_and_policy/presentation/view/privacy_and_policy_screen.dart';
import 'package:alefk/features/terms_and_conditions/presentation/view/terms_and_conditions_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/mobile_app/auth/forget_password/presentation/views/forget_password_screen.dart';
import '../../features/mobile_app/auth/login/presentation/view/login_screen.dart';
import '../../features/mobile_app/auth/register/presentation/view/register_screen.dart';
import '../../features/mobile_app/bottom_bar/views/pages/bottom_bar_page.dart';
import '../../features/mobile_app/edit_profile/presentation/view/edit_profile_screen.dart';
import '../../features/mobile_app/home/views/bloc/home_bloc.dart';
import '../../features/mobile_app/home/views/pages/add_post_page.dart';
import '../../features/mobile_app/home/views/pages/home_page.dart';
import '../../features/mobile_app/home/views/widgets/post_details_page.dart';
import '../../features/mobile_app/settings/views/pages/settings_screen.dart';
import '../../features/mobile_app/shop/views/pages/categories_page.dart';
import '../../features/mobile_app/shop/views/pages/product_details.dart';
import '../../features/mobile_app/shop/views/pages/shop_page.dart';
import '../../features/mobile_app/splash/presentation/view/splash_screen.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginScreen();
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
        path: '/shop',
        name: 'shop',
        builder: (context, state) {
          return const ShopPage();
        },
      ),
      GoRoute(
        path: '/posts/:id',
        builder: (context, state) {
          final postId = int.parse(state.pathParameters['id']!);
          log('Post ID: $postId');
          return PostDetailsPage(postId: postId);
        },
      ),
      GoRoute(
        path: '/add-post',
        name: 'add-post',
        builder: (context, state) {
          final bloc = state.extra as HomeBloc;
          return BlocProvider.value(
            value: bloc,
            child: const AddPostPage(),
          );
        },
      ),
      GoRoute(
        path: '/categories',
        name: 'categories',
        builder: (context, state) {
          return const CategoriesPage();
        },
      ),
      GoRoute(
        path: '/product-details',
        name: 'productDetails',
        builder: (context, state) {
          return const ProductDetails();
        },
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/terms_conditions',
        name: 'terms_conditions',
        builder: (context, state) {
          // Replace with your Terms and Conditions page
          return const TermsAndConditionsScreen();
        },
      ),
      GoRoute(
        path: '/privacy_policy',
        name: 'privacy_policy',
        builder: (context, state) {
          // Replace with your Privacy Policy page
          return const PrivacyAndPolicyScreen(); // Assuming same screen for demo
        },
      ),
      GoRoute(
        path: '/forgot_password',
        name: 'forgot_password',
        builder: (context, state) {
          // Replace with your Privacy Policy page
          return const ForgetPasswordScreen(); // Assuming same screen for demo
        },
      ),
      GoRoute(
        path: '/edit_profile',
        name: 'edit_profile',
        builder: (context, state) {
          // Replace with your Edit Profile page
          return const EditProfileScreen(); // Assuming same screen for demo
        },
      ),

      // Admin Panel Routes

      GoRoute(
        path: '/admin_home',
        name: 'admin_home',
        builder: (context, state) {
          return const AdminHomePage();
        },
      ),
    ],
    errorBuilder: (context, state) => const HomePage(),
  );
}
