import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final double height;
  final double fontSize;

  const Button({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
