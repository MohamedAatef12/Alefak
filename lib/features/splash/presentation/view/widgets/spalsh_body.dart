import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  bool showFirstText = false;
  bool showSecondText = false;
  bool showThirdText = false;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      showFirstText = true;
    });
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      showSecondText = true;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      showThirdText = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      showSpinner = true;
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Image.asset(
              'assets/images/frame1.png',
              fit: BoxFit.fitWidth,
              width: screenWidth,
              height: screenHeight * 0.65,
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: showFirstText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'Alefak',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: AppColors.current.text,
                ),
              ),
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: showSecondText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: showThirdText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'The best choice for adopting and buy products for pets',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: AppColors.current.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            if (showSpinner)
              SpinKitFadingCircle(
                color: AppColors.current.blue,
                size: screenWidth * 0.09,
              ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
