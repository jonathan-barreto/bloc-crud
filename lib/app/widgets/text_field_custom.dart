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
        style:  TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        controller: textController,
        cursorColor: Theme.of(context).colorScheme.primary,
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle:  TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
