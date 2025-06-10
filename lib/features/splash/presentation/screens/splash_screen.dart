import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ts/core/routes/app_routes.dart';
import 'package:ts/core/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (mounted) {
        context.go(AppRoutes.onBoarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset(AppImages.logo)),
    );
  }
}
