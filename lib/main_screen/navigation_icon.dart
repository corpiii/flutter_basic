import 'package:flutter/material.dart';

class NavigationIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  bool isTapped;

  void Function() onPressed;

  NavigationIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.isTapped,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: isTapped ? Colors.green : Colors.black,
            ),
            Text(
              label,
              style: TextStyle(
                color: isTapped ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
