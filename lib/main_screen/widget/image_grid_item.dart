import 'package:flutter/material.dart';

import '../../data/model/image_item.dart';

class ImageGridItem extends StatelessWidget {
  ImageItem image;

  ImageGridItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        image.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
