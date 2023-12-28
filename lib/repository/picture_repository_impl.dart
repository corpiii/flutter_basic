import 'dart:convert';
import 'dart:math';

import 'package:flutter_basic/mapper/picture_mapper.dart';
import 'package:flutter_basic/model/picture.dart';
import 'package:http/http.dart' as http;

import '../dto/picture_dto.dart';
import 'interface/picture_repository.dart';

class PictureRepositoryImpl implements PictureRepository {
  final _base = 'jsonplaceholder.typicode.com';

  @override
  Future<List<Picture>> fetchAllPictureByAlbumId(int albumId) async {
    var url = Uri.https(_base, '/photos');

    var response = await http.get(url);

    // error handling

    List<dynamic> mapList = jsonDecode(response.body);

    List<Picture> pictureListById = mapList
        .where((element) => element['albumId'] == albumId)
        .map((map) {
          var pictureDTO = PictureDTO.fromJson(map);
          Picture picture = PictureMapper().mapperTo(pictureDTO);
          return picture;
        }).toList();

    return pictureListById;
  }
}
