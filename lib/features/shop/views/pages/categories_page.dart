import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/shop/views/widgets/categories_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryName =
        GoRouterState.of(context).uri.queryParameters['categoryName'] ??
            'Categories';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.current.primary,
        elevation: 0,
        forceMaterialTransparency: true,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: IconlyBrokenIcons.arrowLeft_2,
        ),
        title: Text(categoryName),
      ),
      body: Expanded(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CategoriesItems();
          },
        ),
      ),
    );
  }
}
