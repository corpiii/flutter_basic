import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ImagePicker imagePicker = ImagePicker();
  late List<XFile> images;

  int _currentPage = 0;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    images = await imagePicker.pickMultiImage();

    if (images != null) {
      Timer.periodic(Duration(seconds: 5), (timer) {
        _currentPage = (_currentPage + 1) % images.length;
        pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('전자액자'),
      ),
      body: images == null
          ? const Center(
              child: Text('No Data'),
            )
          : PageView(
              controller: pageController,
              children: images!.map((e) {
                return FutureBuilder<Uint8List>(
                    future: e.readAsBytes(),
                    builder: (context, snapshot) {
                      final data = snapshot.data;

                      if (data == null ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Image.memory(
                        data,
                        width: double.infinity,
                      );
                    });
              }).toList(),
            ),
    );
  }
}
