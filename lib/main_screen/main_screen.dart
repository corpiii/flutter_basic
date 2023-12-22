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

          const TitleAppBar(),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('assets/starbucks-image/01_01_2023_winter_e-frequency.png'),
            ),
          ),

          SliverToBoxAdapter(
            child: Image.asset('assets/starbucks-image/02_01_siren_order.png'),
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
