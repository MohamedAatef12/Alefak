import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Product Name",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          height: 200,
        ),
        const SizedBox(height: 20),
        const Text(
          "Product Description",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Back to Categories"),
        ),
      ],
    );
  }
}
