import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ts/core/routes/app_routes.dart';
import 'package:ts/core/utils/app_images.dart';
import 'package:ts/core/widgets/gap.dart';
import 'package:ts/features/auth/presentation/screens/account_registration_screen.dart';

import '../../../../core/widgets/global_text.dart';
import '../widgets/gradient_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.auth,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountRegistrationScreen(),
                          ),
                        );
                      },
                      child: GradientButton(
                        text: "CONTINUE",
                        isItEmail: true,
                        onTap: () {
                          context.pushNamed(AppRoutes.account);
                        },
                      ),
                    ),
                    30.g,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset("assets/icons/Frame.svg"),
                        SvgPicture.asset("assets/icons/Frame (1).svg"),
                        SvgPicture.asset("assets/icons/Frame (2).svg"),
                      ],
                    ),
                    30.g,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalText(
                          "Already have an account?",
                          color: Color(0xFFFFFFFF),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushReplacementNamed(AppRoutes.login);
                          },
                          child: GlobalText(
                            "Log in",
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    61.g,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
