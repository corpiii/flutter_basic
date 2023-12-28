import 'package:flutter_basic/repository/interface/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final String _base = 'https://jsonplaceholder.typicode.com/albums';

  @override
  Future<void> fetchAllAlbums() async {
    
  }
}