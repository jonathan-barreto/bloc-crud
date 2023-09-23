import 'package:flutter/material.dart';

abstract class UpdateEvent {}

class ReadContato extends UpdateEvent {
  int index;

  ReadContato({
    required this.index,
  });
}

class UpdateContato extends UpdateEvent {
  int index;
  BuildContext context;
  String nomeContato, numeroContato;

  UpdateContato({
    required this.index,
    required this.context,
    required this.nomeContato,
    required this.numeroContato,
  });
}
