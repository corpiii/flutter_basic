import 'package:flutter/material.dart';

import '../../model/album.dart';

class PictureListScreen extends StatelessWidget {
  final Album _album;

  const PictureListScreen({
    super.key,
    required Album album,
  }) : _album = album;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          _album.title,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Text('test'),
    );
  }
}
