import '../../model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> fetchAllAlbums();
}