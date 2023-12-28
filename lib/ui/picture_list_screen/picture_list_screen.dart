import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_basic/di/repository_provider.dart';
import 'package:flutter_basic/repository/interface/picture_repository.dart';

import '../../model/album.dart';
import '../../model/picture.dart';

class PictureListScreen extends StatelessWidget {
  final Album _album;
  final PictureRepository _repository = pictureRepository;

  PictureListScreen({
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
    return FutureBuilder<List<Picture>>(
        future: _repository.fetchAllPictureByAlbumId(_album.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var models = snapshot.data!;


          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: models.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      color: Colors.deepPurple,
                      child: Image.network(
                        models[index].thumbnailUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          var httpResponse = error as HttpResponse;

                          return Text('stateCode: ${httpResponse.statusCode}');
                        },
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
