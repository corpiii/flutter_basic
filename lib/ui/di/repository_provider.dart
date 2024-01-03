import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/image_item_repository.dart';

final repositoryProvider = Provider((ref) => PixabayImageItemRepository());