import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
