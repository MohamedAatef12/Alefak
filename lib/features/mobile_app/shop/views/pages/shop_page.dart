import 'package:alefk/core/constants/sized_box.dart';
import 'package:flutter/material.dart';

import '../widgets/shop_app_bar.dart';
import '../widgets/shop_categories.dart';
import '../widgets/shop_search.dart';
import '../widgets/shop_suggestions.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ShopAppBar(),
              ),
              SliverToBoxAdapter(
                child: SizedBoxConstants.verticalMedium,
              ),
              SliverToBoxAdapter(
                child: ShopSearch(),
              ),
              SliverToBoxAdapter(
                child: SizedBoxConstants.verticalMedium,
              ),
              SliverToBoxAdapter(
                child: ShopCategories(),
              ),
              SliverToBoxAdapter(
                child: SizedBoxConstants.verticalMedium,
              ),
              SliverToBoxAdapter(
                child: ShopSuggestions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
