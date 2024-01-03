import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../data/model/image_item.dart';
import '../di/view_model_provider.dart';
import 'widget/image_grid_item.dart';

class MainScreen extends ConsumerStatefulWidget {
  MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainViewModelProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            textFieldWidget(onPressed: (query) {
              ref.read(mainViewModelProvider.notifier).searchImage(query);
            }),
            const SizedBox(height: 20),
            state.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : imageGridWidget(state.list),
          ],
        ),
      ),
    );
  }

  Widget textFieldWidget({required void Function(String query) onPressed}) {
    return TextField(
      controller: _textFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF4FB6B2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF4FB6B2),
          ),
        ),
        hintText: 'Search',
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF4FB6B2), // 외곽선 컬러 설정
            ),
            onPressed: () {
              onPressed(_textFieldController.text);
            }),
      ),
    );
  }

  Widget imageGridWidget(List<ImageItem> list) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageGridItem(image: list[index]);
        },
      ),
    );
  }
}
