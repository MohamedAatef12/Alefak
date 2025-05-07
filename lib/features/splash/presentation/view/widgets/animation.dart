import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';


class SlidingAnimation extends StatefulWidget {
  const SlidingAnimation({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  State<SlidingAnimation> createState() => _SlidingAnimationState();
}

class _SlidingAnimationState extends State<SlidingAnimation> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: widget.slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: widget.slidingAnimation,
            child: Column(
              children: [
                Text(
                  'Alefak',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // 5% of screen width
                    color: AppColors.current.text,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitWidth, // 20% of screen height
                ),
                const Spacer(),
                Text(
                  'The best choice for adopting and buy products for pets',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03, // 5% of screen width
                    color: AppColors.current.text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
