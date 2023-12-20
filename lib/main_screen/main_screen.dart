import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _url = 'https://flutter.dev';
  late WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 웹 브라우저'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_outlined),
          ),
          PopupMenuButton<String>(
              onSelected: (value) {
                _controller.loadUrl(value);
              },
              itemBuilder: (context) =>
              [
                PopupMenuItem<String>(
                  child: Text('google'),
                  value: 'https://www.google.co.kr',
                ),
                PopupMenuItem<String>(
                  child: Text('naver'),
                  value: 'https://www.naver.com',
                ),
                PopupMenuItem<String>(
                  child: Text('kakao'),
                  value: 'https://www.kakao.com',
                ),
              ])
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (await _controller.canGoBack()) {
            await _controller.goBack();
            return false;
          }
          return true;
        },
        child: WebView(
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
        ),
      ),
    );
  }
}
