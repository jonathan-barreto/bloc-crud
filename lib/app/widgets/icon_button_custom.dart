import 'package:crud/app/features/home/bloc/home_bloc.dart';
import 'package:crud/app/features/home/bloc/home_event.dart';
import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final IconData icon;
  final HomeBloc bloc;
  final HomeEvent event;

  const IconButtonCustom({
    super.key,
    required this.icon,
    required this.bloc,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        bloc.inputController.add(event);
      },
      icon: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
