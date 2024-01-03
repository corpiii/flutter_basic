import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/image_item.dart';

part 'list_state.freezed.dart';
part 'list_state.g.dart';

@freezed
class ListState with _$ListState {
  factory ListState({
    required List<ImageItem> list,
    required bool isLoading,
  }) = _ListState;

  factory ListState.fromJson(Map<String, dynamic> json) => _$ListStateFromJson(json);
}