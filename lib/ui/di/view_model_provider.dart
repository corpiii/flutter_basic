import 'package:flutter_basic/ui/di/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main_screen/main_view_model.dart';
import '../main_screen/state/list_state.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, ListState>((ref) {
  return MainViewModel(repository: ref.watch(repositoryProvider));
});
