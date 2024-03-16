import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}