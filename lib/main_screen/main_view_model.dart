import 'dart:async';

import '../model/timer_manager.dart';

class MainViewModel {
  TimerManager _manager = TimerManager();

  bool _isRunning = false;
  List<String> _lapTimes = [];

  Stream<int> get timeStream => _manager.timeStream;

  StreamController<List<String>> _lapTimesStreamController = StreamController();
  Stream<List<String>> get lapTimesStream => _lapTimesStreamController.stream;

  StreamController<bool> _isRunningStreamController = StreamController();
  Stream<bool> get isRunningStream => _isRunningStreamController.stream;

  void reset() {
    _isRunning = false;
    _lapTimes = [];
    _manager.timerReset();

    _isRunningStreamController.add(false);
    _lapTimesStreamController.add([]);
  }

  void recordLapTime(String time) {
    if (_lapTimes.length == 0) {
      _lapTimes = ['${_lapTimes.length + 1}등 $time'];
    } else {
      _lapTimes = ['${_lapTimes.length + 1}등 $time'] + _lapTimes;
    }

    _lapTimesStreamController.add(_lapTimes);
  }

  void toggleRunningState() {
    _isRunning = !_isRunning;
    _isRunning ? _manager.timerStart() : _manager.timerPause();
    _isRunningStreamController.add(_isRunning);
  }
}