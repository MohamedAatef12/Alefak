import 'package:alefk/features/home/views/widgets/custom_home_app_bar.dart';
import 'package:alefk/features/home/views/widgets/custom_home_search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHomeAppBar(),
            SizedBox(height: 20),
            CustomHomeSearchBar(),
          ],
        ),
      ),
    );
  }
}
