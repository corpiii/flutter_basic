import 'package:flutter/material.dart';
import 'package:flutter_basic/di/album_repository_provider.dart';
import 'package:flutter_basic/repository/interface/album_repository.dart';

import '../../model/album.dart';

class MainScreen extends StatelessWidget {
  final AlbumRepository _repository = albumRepository;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.deepPurple,
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 10,
                        child: Text(models[index].title),
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
