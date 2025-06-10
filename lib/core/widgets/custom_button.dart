import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool isFirstTrue;
  final bool isSecondTrue;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.isFirstTrue,
    required this.isSecondTrue,
    this.onPressed,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.padding,
    this.textStyle,
    this.icon,
    this.isLoading = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color backgroundColor = const Color(0xFFA6AAB4); // default false holat

  @override
  void initState() {
    super.initState();
    _updateColor(); // boshlanishda aniqlab olamiz
  }

  @override
  void didUpdateWidget(covariant CustomButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Agar isFirstTrue yoki isSecondTrue o‘zgarsa, rangni yangilaymiz
    if (widget.isFirstTrue != oldWidget.isFirstTrue ||
        widget.isSecondTrue != oldWidget.isSecondTrue) {
      _updateColor();
    }
  }

  void _updateColor() {
    setState(() {
      if (widget.isFirstTrue && widget.isSecondTrue) {
        backgroundColor = const Color(0xFF47F490); // true bo‘lsa yashil
      } else {
        backgroundColor = const Color(0xFFA6AAB4); // false bo‘lsa kulrang
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(textColor),
          padding: MaterialStateProperty.all(
            widget.padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          elevation: MaterialStateProperty.all(2),
          shadowColor: MaterialStateProperty.all(
            backgroundColor.withOpacity(0.3),
          ),
        ),
        child: widget.isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    widget.icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style:
                        widget.textStyle ??
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
