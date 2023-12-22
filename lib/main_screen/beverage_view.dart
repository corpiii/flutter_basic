import 'package:flutter/material.dart';

class BeverageView extends StatelessWidget {
  final String imgUrl;
  final String name;

  const BeverageView({super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        height: 180,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                imgUrl,
                width: 120,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
