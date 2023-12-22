import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'start_view.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 330,
      floating: false,
      pinned: true,
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Column(
              children: [
                Lottie.asset(
                  'assets/animation/forest_animation.json',
                  animate: true,
                  alignment: Alignment.topCenter,
                ),
                StarView(),
              ],
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: Container(
          height: 30,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _whatsNewWidget(),
                  Container(
                    width: 10,
                  ),
                  _couponWidget(),
                  Spacer(),
                  Icon(Icons.notifications,color: Colors.white,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _whatsNewWidget() {
    return Row(
      children: [
        Icon(
          Icons.mail,
          color: Colors.grey,
        ),
        Container(
          width: 5,
        ),
        Text(
          'What\'s New',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _couponWidget() {
    return Row(
      children: [
        Icon(
          Icons.airplane_ticket,
          color: Colors.grey,
        ),
        Container(
          width: 5,
        ),
        Text(
          'Coupon',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
