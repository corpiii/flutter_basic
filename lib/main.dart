import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/main_view_model.dart';
import 'package:provider/provider.dart';

import 'main_screen/main_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MainViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
