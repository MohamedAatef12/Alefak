import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/themes/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = DI.find<ICacheManager>().getUserData(); // fetch once
    final imagePath = userData?.image;
    final double radius = MediaQuery.sizeOf(context).height * 0.08;

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.current.primary,
      child: _ProfileImageInner(imagePath: imagePath, radius: radius),
    );
  }
}

class _ProfileImageInner extends StatelessWidget {
  final String? imagePath;
  final double radius;

  const _ProfileImageInner({
    required this.imagePath,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (imagePath != null &&
        (imagePath!.startsWith('http://') || imagePath!.startsWith('https://'))) {
      imageWidget = Image.network(
        imagePath!,
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (context, error, stackTrace) => _fallback(),
      );
    } else if (imagePath != null && imagePath!.startsWith('/9j/')) {
      imageWidget = Image.memory(
        base64Decode(imagePath!),
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (context, error, stackTrace) => _fallback(),
      );
    } else {
      imageWidget = _fallback();
    }

    return ClipOval(
      child: SizedBox(
        width: radius * 1.8,
        height: radius * 1.8,
        child: imageWidget,
      ),
    );
  }

  Widget _fallback() => Image.asset(
    'assets/images/profile.png',
    fit: BoxFit.cover,
    width: radius * 2,
    height: radius * 2,
  );
}
