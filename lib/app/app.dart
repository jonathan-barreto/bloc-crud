import 'package:crud/app/core/app_colors.dart';
import 'package:crud/app/features/home/view/home_page.dart';
import 'package:crud/app/features/update/views/update_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.light(
      primary: appColors['primaryColor']!,
      secondary: appColors['secondColor']!,
      background: appColors['backGroundColor']!,
    ).copyWith();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/update': (context) => const UpdatePage(),
      },
    );
  }
}
