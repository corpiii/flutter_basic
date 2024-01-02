import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/main_view_model.dart';
import 'package:flutter_basic/main_screen/widget/image_grid_item.dart';
import 'package:provider/provider.dart';

import '../data/model/image_item.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    bool isLoading = viewModel.isLoading;
    List<ImageItem> list = viewModel.imageItems;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              textFieldWidget(onPressed: (query) {
                viewModel.searchImage(query);
              }),
              SizedBox(height: 20),
              isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : imageGridWidget(list),
            ],
          ),
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
          crossAxisSpacing: 30
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageGridItem(image: list[index]);
        },
      ),
    );
  }
}
