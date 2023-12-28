import 'package:flutter/material.dart';
import 'package:flutter_basic/di/album_repository_provider.dart';
import 'package:flutter_basic/repository/interface/album_repository.dart';

class MainScreen extends StatelessWidget {
  final AlbumRepository _repository = albumRepository;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _repository.fetchAllAlbums();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 3,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
