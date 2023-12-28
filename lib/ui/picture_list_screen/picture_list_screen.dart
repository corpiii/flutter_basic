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
      body: pictureGridWidget(context),
    );
  }

  Widget pictureGridWidget(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.deepPurple,
              ),
            ),
          );
        });
  }
}
