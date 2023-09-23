import 'package:crud/app/app.dart';
import 'package:crud/init.dart' as di;
import 'package:flutter/material.dart';

void main() async {
  await di.init();
  runApp(const App());
}
