import 'package:flutter/material.dart';

class SensorScreen extends StatelessWidget {


  const SensorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: centerY,
            left: centerX,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
