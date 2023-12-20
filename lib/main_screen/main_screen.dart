import 'dart:async';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  List<String> _lapTimes = [];

  void _clickButton() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    }
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time += 1;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $time');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int second = _time ~/ 100;
    int hundredth = _time % 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$second',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                '$hundredth'.padLeft(2, '0'),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: _lapTimes.map((e) {
                return Center(child: Text(e));
              }).toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: _reset,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _clickButton();
                  });
                },
                child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _recordLapTime('$second.$hundredth');
                  });
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
