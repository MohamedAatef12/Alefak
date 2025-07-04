import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_bloc.dart';
import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_events.dart';
import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_states.dart';
import 'package:alefk/features/home/views/pages/home_page.dart';
import 'package:alefk/features/settings/views/bloc/settings_bloc.dart';
import 'package:alefk/features/settings/views/bloc/settings_states.dart';
import 'package:alefk/features/settings/views/pages/settings_screen.dart';
import 'package:alefk/features/shop/views/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context,themeState) {
          AppColors.current = themeState.isDark ? defaultDarkColors : defaultLightColors;
          return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              Widget page;
              if (state is HomePageState) {
                page = const HomePage();
              } else if (state is CartPageState) {
                page = const ShopPage();
              } else if (state is SettingsPageState) {
                page = const SettingsScreen();
              } else {
                page = const HomePage();
              }

              return Scaffold(
                body: page,
                bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: AppColors.current.transparent,
                    enableFeedback: false,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: false,
                    selectedFontSize: 18,
                    selectedIconTheme: const IconThemeData(
                      size: 30,
                    ),
                    unselectedIconTheme: const IconThemeData(
                      size: 28,
                    ),
                    currentIndex: state.index,
                    onTap: (index) {
                      final bloc = context.read<BottomNavigationBloc>();
                      bloc.add(NavigateToPage(index));
                    },
                    items: [
                      const BottomNavigationBarItem(
                          icon: IconlyBrokenIcons.home, label: 'Home'),
                      BottomNavigationBarItem(
                          icon: IconlyBrokenIcons.shoppingCart, label: 'Cart'),
                      const BottomNavigationBarItem(
                          icon: IconlyBrokenIcons.settings, label: 'Settings'),
                    ],
                  ),
                ),
              );
            },
          );

        }
    )
    );
  }
}
