import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/model/timer_manager.dart';

class MainScreen extends StatefulWidget {
  TimerManager manager;

  MainScreen({super.key, required this.manager});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _time = 0;
  Icon _startButtonIcon = Icon(Icons.play_arrow);
  List<String> _recordList = [];

  void setTimeCompletion(int value) {
    setState(() {
      _time = value;
    });
  }

  void setIsRunningCompletion(bool value) {
    setState(() {
      _startButtonIcon = value ? Icon(Icons.pause) : Icon(Icons.play_arrow);
    });
  }

  void setLapTimesCompletion(List<String> value) {
    setState(() {
      _recordList = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.manager.bind(setTimeCompletion: setTimeCompletion,
        setIsRunningCompletion: setIsRunningCompletion,
        setLapTimesCompletion: setLapTimesCompletion);
  }

  @override
  void dispose() {
    widget.manager.reset();
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
              children: _recordList.map((e) {
                return Center(child: Text(e));
              }).toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: widget.manager.reset,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: widget.manager.toggleRunningState,
                child: _startButtonIcon,
              ),
              FloatingActionButton(
                onPressed: () {
                  widget.manager.recordLapTime('$second.$hundredth');
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
