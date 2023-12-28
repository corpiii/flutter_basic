import 'package:flutter_basic/repository/album_repository_impl.dart';
import 'package:flutter_basic/repository/interface/album_repository.dart';
import 'package:flutter_basic/repository/interface/picture_repository.dart';
import 'package:flutter_basic/repository/picture_repository_impl.dart';

final AlbumRepository albumRepository = AlbumRepositoryImpl();

final PictureRepository pictureRepository = PictureRepositoryImpl();
