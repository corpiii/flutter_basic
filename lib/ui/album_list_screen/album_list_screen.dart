import 'package:flutter/material.dart';
import 'package:flutter_basic/di/repository_provider.dart';
import 'package:flutter_basic/repository/interface/album_repository.dart';
import 'package:flutter_basic/ui/picture_list_screen/picture_list_screen.dart';

import '../../model/album.dart';

class AlbumListScreen extends StatelessWidget {
  final AlbumRepository _repository = albumRepository;

  AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Album>>(
              future: _repository.fetchAllAlbums(),
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return Center(child: CircularProgressIndicator());
                }

                List<Album> models = snapshot.data!;

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: albumTitleWidget(context, models[index]));
                  },
                );
              }),
        ),
      ),
    );
  }

  Widget albumTitleWidget(BuildContext context, Album album) {
    final height = MediaQuery.of(context).size.height / 10;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
          return PictureListScreen(album: album,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.deepPurple,
        ),
        width: double.infinity,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              album.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
