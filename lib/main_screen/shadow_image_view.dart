import 'package:flutter/material.dart';

class ShadowImageView extends StatelessWidget {
  final String imgUrl;

  const ShadowImageView({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]
        ),
        child: Image.asset(imgUrl),
      ),
    );
  }
}
