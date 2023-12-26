import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScene extends StatefulWidget {
  const MainScene({super.key});

  @override
  State<MainScene> createState() => _MainSceneState();
}

class _MainSceneState extends State<MainScene> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> save(String heightText, String weightText) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble('height', double.parse(heightText));
    prefs.setDouble('weight', double.parse(weightText));
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '${height.toInt()}';
      _weightController.text = '${weight.toInt()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        centerTitle: false,
        title: Text('비만도 계산기'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            // 에러를 처리하기 위한 form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '키를 입력하세요';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '몸무게',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '몸무게를 입력하세요';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        final height = _heightController.text;
                        final weight = _weightController.text;

                        save(height, weight);

                        context.push(
                          Uri(
                            path: '/result',
                            queryParameters: {
                              'height' : height,
                              'weight' : weight
                            },
                          ).toString(),
                        );
                      }
                    },
                    child: Text('결과')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
