import 'package:flutter/material.dart';

class ShopSuggestions extends StatelessWidget {
  const ShopSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> suggestions = [
      Product(
          "happy cat", "Minaks Mix 5KG", "800 LE", "assets/images/logo.png"),
      Product(
          "RawBlends", "Poultry Feast 8KG", "900 LE", "assets/images/logo.png"),
      Product("Purina", "Pro Plan Focus", "850 LE", "assets/images/logo.png"),
      Product(
          "Cat Litter Box", "high quality", "100 LE", "assets/images/logo.png"),
      Product(
          "Pet Backpack", "Dog Backpack", "500 LE", "assets/images/logo.png"),
      Product(
          "Skoon", "Fine Grain Cat Litter", "200 LE", "assets/images/logo.png"),
    ];
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("مقترحات لك",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            itemCount: suggestions.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final product = suggestions[index];
              return buildProductCard(product);
            },
          ),
        ],
      ),
    );
  }

  Widget buildProductCard(Product product) {
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
          Expanded(child: Image.asset(product.image, fit: BoxFit.cover)),
          Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(product.description),
          Text("Price: ${product.price}"),
          ElevatedButton(onPressed: () {}, child: Text("Add to cart")),
        ],
      ),
    );
  }
}

class Product {
  final String title;
  final String description;
  final String price;
  final String image;

  Product(this.title, this.description, this.price, this.image);
}
