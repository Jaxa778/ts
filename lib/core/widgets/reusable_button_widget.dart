import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;

  const ReusableButton({
    super.key,
    this.text,
    this.onPressed,
    this.height,
    this.fontSize,
    this.color,
    this.textColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: height ?? 56,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey,
          // shape: const StadiumBorder(),
          elevation: 0,
        ),
        child: Text(
          text ?? '',
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
