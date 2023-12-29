import 'dart:async';

class TimerManager {
  Timer? _timer;
  int _time = 0;
  StreamController<int> _timeStreamController = StreamController();
  Stream<int> get timeStream => _timeStreamController.stream;

  void timerStart() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      _time = _time + 1;
      _timeStreamController.add(_time);
    });
  }

  void timerPause() {
    _timer?.cancel();
  }

  void timerReset() {
    _timer?.cancel();
    _time = 0;
    _timeStreamController.add(0);
  }
}