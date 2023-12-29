import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/main_view_model.dart';

import 'main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MainViewModel manager = MainViewModel();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(viewModel: manager,),
    );
  }
}