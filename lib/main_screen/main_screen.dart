import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/body_list_view.dart';
import 'package:flutter_basic/main_screen/title_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          TitleAppBar(),

          SliverToBoxAdapter(
            child: bodyList(),
          ),

          SliverToBoxAdapter(
            child: bodyList(),
          ),

          SliverToBoxAdapter(
            child: bodyList(),
          ),
        ],
      )
    );
  }

  Widget bodyList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 400,
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }
}
