import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color color;
  final double fontSize;

  const MainButton({super.key, this.text, this.onPressed,this.width = double.infinity,
    this.height = 50.0,
    this.color = Colors.blue,
    this.fontSize = 16.0,    });

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text ?? "",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
