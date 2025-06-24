import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget {
  final int count;
  final TextStyle style;

  const AnimatedCounter({super.key, required this.count, required this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: Text(
        '$count',
        key: ValueKey<int>(count),
        style: style,
      ),
    );
  }
}
