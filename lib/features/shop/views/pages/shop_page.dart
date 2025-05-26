import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/features/shop/views/widgets/shop_app_bar.dart';
import 'package:alefk/features/shop/views/widgets/shop_categories.dart';
import 'package:alefk/features/shop/views/widgets/shop_search.dart';
import 'package:alefk/features/shop/views/widgets/shop_suggestions.dart';
import 'package:flutter/material.dart';

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
