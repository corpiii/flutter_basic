import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/image_item_repository.dart';
import 'state/list_state.dart';

class MainViewModel extends StateNotifier<ListState> {
  final ImageItemRepository _repository;

  MainViewModel({required ImageItemRepository repository})
      : _repository = repository,
        super(ListState(list: [], isLoading: false));

  void searchImage(String query) async {
    state = state.copyWith(isLoading: true);

    final response = await _repository.getImageItems(query);
    state = state.copyWith(list: response);

    state = state.copyWith(isLoading: false);
  }
}
