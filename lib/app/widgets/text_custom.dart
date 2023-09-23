import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final double fontSize;
  final String text;

  const TextCustom({
    super.key,
    required this.fontSize,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
