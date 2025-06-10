import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ts/core/routes/app_routes.dart';

import '../../../../core/widgets/global_text.dart';
import '../widgets/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              'https://i.pinimg.com/736x/80/1f/1f/801f1fd8b355d99c0ef8c7b56c3c9c0a.jpg',
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(right: 15, left: 15, top: 80),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(right: 16, left: 16, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 28,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: Color(0xFFF41671),
                          size: 30,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFFF41671),
                          size: 30,
                        ),
                      ),
                    ),
                    GradientButton(
                      text: "LOG IN",
                      onTap: () {},
                      isItEmail: false,
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(AppRoutes.account);
                      },
                      child: GlobalText(
                        "Create a new account",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
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
