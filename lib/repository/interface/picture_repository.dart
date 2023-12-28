import 'package:flutter_basic/model/picture.dart';

abstract interface class PictureRepository {
  Future<List<Picture>> fetchAllPictureByAlbumId(int albumId);
}