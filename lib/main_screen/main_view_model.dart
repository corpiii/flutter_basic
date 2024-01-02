import 'package:flutter/material.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = PixabayImageItemRepository();
  List<ImageItem> _imageItems = [];
  bool _isLoading = false;

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  bool get isLoading => _isLoading;

  void searchImage(String query) async {
    _isLoading = true;
    notifyListeners();

    _imageItems = await _repository.getImageItems(query);

    _isLoading = false;
    notifyListeners();
  }
}