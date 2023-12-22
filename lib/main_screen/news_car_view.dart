import 'package:flutter/material.dart';

class NewsCardView extends StatelessWidget {
  void Function() onPressed;
  String imgUrl;
  String title;
  String subTitle;

  NewsCardView({
    super.key,
    required this.onPressed,
    required this.imgUrl,
    required this.title,
    required this.subTitle,
  });

  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imgUrl,
            width: 250,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subTitle,
          )
        ],
      ),
    );
  }
}
