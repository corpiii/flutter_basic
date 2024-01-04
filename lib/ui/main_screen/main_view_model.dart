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
    state = state.copyWith(isLoading: true);

    final result = _repository.getImageItems(query);

    result.then((value) {
      state = state.copyWith(list: value, isLoading: false);
    }, onError: (error) {
      state = state.copyWith(list: [], isLoading: false);
      onError(error);
    });
  }
}
