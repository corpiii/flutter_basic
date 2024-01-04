import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_basic/data/mapper/image_mapper.dart';

import '../data_source/pixabay_api.dart';
import '../model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}

class PixabayImageItemRepository implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    try {
      var dto = await _api.getImagesResult(query);

      if (dto.hits == null) {
        return Result<List<ImageItem>>.value([]);
      }

      var value = dto.hits!.map((e) => e.toImageItem()).toList();

      return Result<List<ImageItem>>.value(value);
    } catch (error) {
      return Result.error(error);
    }
  }
}

// class MockImageItemRepository implements ImageItemRepository {
//   @override
//   Future<List<ImageItem>> getImageItems(String query) async {
//     await Future.delayed(const Duration(seconds: 1));
//
//     if (query == 'apple') {
//       return [
//         ImageItem(
//             imageUrl:
//                 "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
//             tags: ''),
//         ImageItem(
//             imageUrl:
//                 "https://cdn.pixabay.com/photo/2017/09/26/13/39/apples-2788651_150.jpg",
//             tags: ''),
//         ImageItem(
//             imageUrl:
//                 "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
//             tags: ''),
//       ];
//     } else {
//       return [
//         ImageItem(
//             imageUrl:
//                 "https://cdn.pixabay.com/photo/2015/03/14/19/45/suit-673697_150.jpg",
//             tags: ''),
//         ImageItem(
//             imageUrl:
//                 "https://cdn.pixabay.com/photo/2019/09/21/09/07/banana-4493420_150.jpg",
//             tags: ''),
//       ];
//     }
//   }
// }
