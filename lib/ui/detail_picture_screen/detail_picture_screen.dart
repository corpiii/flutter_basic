import 'package:flutter/material.dart';

import '../../model/picture.dart';

class DetailPictureScreen extends StatelessWidget {
  final Picture _picture;

  const DetailPictureScreen({
    super.key,
    required Picture picture,
  }) : _picture = picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
        title: Text(
          _picture.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Hero(
              tag: 'image',
              child: Image.network(_picture.url),
            ),
          ],
        ),
      ),
    );
  }
}
