import 'package:flutter_basic/dto/album_dto.dart';

import '../model/album.dart';

class AlbumMapper {
  Album mapperTo(AlbumDTO dto) {
    return Album(
      userId: dto.userId ?? -1,
      id: dto.id ?? -1,
      title: dto.title ?? "",
    );
  }
}
