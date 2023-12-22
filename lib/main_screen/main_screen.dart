import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/body_list_view.dart';
import 'package:flutter_basic/main_screen/card_view.dart';
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
            child: Image.asset(
                'assets/starbucks-image/01_01_2023_winter_e-frequency.png'),
          ),
        ),
        SliverToBoxAdapter(
          child: Image.asset('assets/starbucks-image/02_01_siren_order.png'),
        ),
        SliverToBoxAdapter(
          child: quickOrderWidget(),
        ),
        SliverToBoxAdapter(
          child: bodyList(),
        ),
      ],
    ));
  }

  Widget bodyList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 400,
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }

  Widget quickOrderWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Quick Order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                '최근 주문',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardView(onPressed: () {}),
                Container(width: 30,),
                CardView(onPressed: () {}),
                Container(width: 30,),
                CardView(onPressed: () {}),
                Container(width: 30,),
                CardView(onPressed: () {}),
                Container(width: 30,),
                CardView(onPressed: () {}),
                Container(width: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
