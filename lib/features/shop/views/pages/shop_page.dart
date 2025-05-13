import 'package:alefk/features/shop/views/widgets/shop_app_bar.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ShopAppBar(),
          ],
        ),
      ),
    );
  }
}
