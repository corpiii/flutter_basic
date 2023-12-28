import 'dart:convert';

import 'package:flutter_basic/mapper/album_mapper.dart';
import 'package:flutter_basic/model/album.dart';
import 'package:flutter_basic/repository/interface/album_repository.dart';
import 'package:http/http.dart' as http;

import '../dto/album_dto.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final _base = 'jsonplaceholder.typicode.com';

  @override
  Future<List<Album>> fetchAllAlbums() async {
    var url = Uri.https(_base, '/albums');

    var response = await http.get(url);

    // error handling

    List<dynamic> mapList = jsonDecode(response.body);

    List<Album> albumList = mapList.map((map) {
      var albumDTO = AlbumDTO.fromJson(map);
      var albumModel = AlbumMapper().mapperTo(albumDTO);

      return albumModel;
    }).toList();

    return albumList;
  }
}