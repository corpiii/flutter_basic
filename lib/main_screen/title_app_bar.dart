import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 300,
      floating: false,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text('data'),
                // Row(
                //   children: [
                //     Icon(Icons.mail),
                //     Text('What\'s New'),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Lottie.asset(
          'assets/animation/forest_animation.json',
          alignment: Alignment.topCenter,
          animate: false,
        ),
      ),
    );
  }
}
