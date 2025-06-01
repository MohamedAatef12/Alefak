import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        context.pushNamed('login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Image.asset(
                'assets/images/logo.png',
                width: screenWidth * 0.4,
              ),
              SizedBox(height: screenHeight * 0.02),
              Spacer(),
              SpinKitDoubleBounce(
                color: AppColors.current.blue,
                size: screenWidth * 0.09,
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        );
      },
    );
  }
}
