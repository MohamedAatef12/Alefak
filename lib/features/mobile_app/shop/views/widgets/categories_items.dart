import 'package:alefk/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        context.pushNamed("productDetails");
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.12),
            Column(
              children: [
                FittedBox(
                  child: const Text(
                    "اسم المنتج",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  child: const Text(
                    "وصف قصير للمنتج",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 2),
                FittedBox(
                  child: const Text(
                    "السعر: 100.00",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
                Spacer(),
                CustomFilledButton(
                  widthFactor: 0.3,
                  heightFactor: 0.03,
                  text: "إضافة إلى السلة",
                  textStyle: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Add your add to cart logic here
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
