import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_bloc.dart';
import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_events.dart';
import 'package:alefk/features/bottom_bar/views/bloc/bottom_bar_states.dart';
import 'package:alefk/features/cart/views/pages/cart_page.dart';
import 'package:alefk/features/home/views/pages/home_page.dart';
import 'package:alefk/features/settings/views/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          Widget page;
          if (state is HomePageState) {
            page = const HomePage();
          } else if (state is CartPageState) {
            page = const CartPage();
          } else if (state is SettingsPageState) {
            page = const SettingsPage();
          } else {
            page = const HomePage();
          }

          return Scaffold(
            body: page,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) {
                final bloc = context.read<BottomNavigationBloc>();
                bloc.add(NavigateToPage(index));
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
