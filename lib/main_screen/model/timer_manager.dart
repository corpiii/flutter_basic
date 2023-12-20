import 'dart:async';

class TimerManager {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  List<String> _lapTimes = [];

  void Function(int)? _setTimeCompletion;
  void Function(bool)? _setIsRunningCompletion;
  void Function(List<String>)? _setLapTimesCompletion;

  set _setTime(int value) {
    _time = value;

    if (_setTimeCompletion != null) {
      _setTimeCompletion!(value);
    }
  }

  set _setIsRunning(bool value) {
    _isRunning = value;

    if (_setIsRunningCompletion != null) {
      _setIsRunningCompletion!(value);
    }
  }

  set _setLapTimes(List<String> value) {
    _lapTimes = value;

    if (_setLapTimesCompletion != null) {
      _setLapTimesCompletion!(value);
    }
  }

  void bind({required void Function(int) setTimeCompletion,
    required void Function(bool) setIsRunningCompletion,
    required void Function(List<String>) setLapTimesCompletion,
  }) {
    _setTimeCompletion = setTimeCompletion;
    _setIsRunningCompletion = setIsRunningCompletion;
    _setLapTimesCompletion = setLapTimesCompletion;
  }

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _setTime = _time + 1;
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void reset() {
    _setIsRunning = false;
    _setTime = 0;
    _setLapTimes = [];
    _timer?.cancel();
  }

  void recordLapTime(String time) {
    _setLapTimes = ['${_lapTimes.length + 1}등 $time'] + _lapTimes;
  }

  void toggleRunningState() {
    _setIsRunning = !_isRunning;
    _isRunning ? _start() : _pause();
  }
}