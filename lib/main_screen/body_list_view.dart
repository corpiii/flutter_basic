import 'package:flutter/material.dart';

class BodyListView extends StatelessWidget {
  const BodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 400,
          color: Colors.green[300],
        ),
      ),
    );
  }
}
