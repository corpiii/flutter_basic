import 'package:async/async.dart';
import 'package:flutter_basic/data/model/image_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/image_item_repository.dart';
import 'state/list_state.dart';

class MainViewModel extends StateNotifier<ListState> {
  final ImageItemRepository _repository;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository,
        super(ListState(list: [], isLoading: false));

  void searchImage({
    required String query,
    required void Function(Exception) onError,
  }) async {
    if (query == '') {
      onError(Exception('값이 비어있습니다.'));
      return;
    }

    state = state.copyWith(isLoading: true);

    final result = await _repository.getImageItems(query);

    switch (result) {
      case ValueResult<List<ImageItem>>():
        var value = result.asValue.value;

        state = state.copyWith(list: value, isLoading: false);
      case ErrorResult():
        var error = result.asError.error as Exception;

        state = state.copyWith(list: [], isLoading: false);
        onError(error);
    }
  }
}
