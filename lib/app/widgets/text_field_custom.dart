import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController textController;

  const TextFieldCustom({
    super.key,
    required this.label,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: textController,
        cursorColor: Colors.white,
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
