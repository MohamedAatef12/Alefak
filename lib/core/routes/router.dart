import 'package:alefk/features/bottom_bar/views/pages/bottom_bar_page.dart';
import 'package:alefk/features/home/views/bloc/home_bloc.dart';
import 'package:alefk/features/home/views/pages/add_post_page.dart';
import 'package:alefk/features/home/views/pages/home_page.dart';
import 'package:alefk/features/settings/views/pages/settings_screen.dart';
import 'package:alefk/features/shop/views/pages/categories_page.dart';
import 'package:alefk/features/shop/views/pages/product_details.dart';
import 'package:alefk/features/shop/views/pages/shop_page.dart';
import 'package:alefk/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    ],
  );
}
