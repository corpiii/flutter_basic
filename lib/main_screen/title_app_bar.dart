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
      toolbarHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Lottie.asset(
          'assets/animation/forest_animation.json',
          // alignment: Alignment.topCenter,
          animate: true,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Row(
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
          color: Colors.white,
        ),
        Container(
          width: 5,
        ),
        Text(
          'What\'s New',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
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
          color: Colors.white,
        ),
        Container(
          width: 5,
        ),
        Text(
          'Coupon',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
