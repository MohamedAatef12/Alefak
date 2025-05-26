import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/shop/views/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Product(),
    );
  }
}
