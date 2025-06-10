import 'package:flutter/material.dart';

import '../../../../core/widgets/global_text.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.isItEmail,
  });
  final String text;
  final VoidCallback onTap;
  final bool isItEmail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF41671), Color(0xFFCF31BF)],
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isItEmail == true
                ? Icon(Icons.email_outlined, color: Colors.white, size: 30)
                : SizedBox(),
            GlobalText(
              text,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
