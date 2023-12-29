import 'dart:async';

class MainViewModel {
  Timer? _timer;
  int _time = 0;
  bool _isRunning = false;
  List<String> _lapTimes = [];

  StreamController<List<String>> _lapTimesStreamController = StreamController();
  Stream<List<String>> get lapTimesStream => _lapTimesStreamController.stream;

  StreamController<bool> _isRunningStreamController = StreamController();
  Stream<bool> get isRunningStream => _isRunningStreamController.stream;

  StreamController<int> _timeStreamController = StreamController();
  Stream<int> get time => _timeStreamController.stream;

  void _start() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _time = _time + 1;
      _timeStreamController.add(_time);
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void reset() {
    _isRunning = false;
    _time = 0;
    _lapTimes = [];
    _timer?.cancel();
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
    _isRunning ? _start() : _pause();
    _isRunningStreamController.add(_isRunning);
  }
}