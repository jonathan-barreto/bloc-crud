import 'package:crud/app/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class CircleAvatarCustom extends StatelessWidget {
  final String text;

  const CircleAvatarCustom({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: TextCustom(
        fontSize: 25,
        text: text,
      ),
    );
  }
}
