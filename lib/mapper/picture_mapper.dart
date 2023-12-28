import '../dto/picture_dto.dart';
import '../model/picture.dart';

class PictureMapper {
  Picture mapperTo(PictureDTO dto) {
    return Picture(
      albumId: dto.albumId ?? -1,
      id: dto.id ?? -1,
      title: dto.title ?? '',
      url: dto.url ?? '',
      thumbnailUrl: dto.thumbnailUrl ?? '',
    );
  }
}
