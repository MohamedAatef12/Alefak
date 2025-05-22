import 'package:alefk/core/constants/padding.dart';
import 'package:flutter/material.dart';

class ShopCategories extends StatelessWidget {
  const ShopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.horizontalSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("تسوق بعض المنتجات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              buildCategoryCard("منتجات غذائية", "assets/images/logo.png"),
              buildCategoryCard("منتجات علاجية", "assets/images/logo.png"),
              buildCategoryCard("إكسسوارات", "assets/images/logo.png"),
              buildCategoryCard("منتجات نظافة", "assets/images/logo.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
