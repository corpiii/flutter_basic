import 'package:flutter/material.dart';

import 'main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          dividerColor: Colors.white54,
          colorScheme: ColorScheme.light(primary: Colors.white),
        ),
      home: MainScreen(),
    );
  }
}