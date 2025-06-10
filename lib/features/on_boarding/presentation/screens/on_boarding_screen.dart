import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ts/core/routes/app_routes.dart';
import 'package:ts/core/utils/app_images.dart';
import 'package:ts/features/on_boarding/presentation/widgets/terms_check_box_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppImages.splash,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                AppImages.textSplash,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 270),
              child: Image.asset(
                AppImages.startTextSplash,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TermsCheckboxWidget(
                onPressed: () {
                  context.go(AppRoutes.signUp);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
