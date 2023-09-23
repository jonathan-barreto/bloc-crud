import 'package:flutter/material.dart';

abstract class HomeEvent {}

class CreateContato extends HomeEvent {}

class ReadContatos extends HomeEvent {}

class UpdateContato extends HomeEvent {
  int index;
  BuildContext context;

  UpdateContato({
    required this.index,
    required this.context,
  });
}

class DeleteContato extends HomeEvent {
  int index;

  DeleteContato({
    required this.index,
  });
}
