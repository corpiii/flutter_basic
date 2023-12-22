import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/title_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          TitleAppBar(),

        ],
      )
    );
  }
}
