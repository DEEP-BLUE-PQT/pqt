import 'dart:async';

class TimerOfAll {
  String time;
  Timer _timer;
  static DateTime now = new DateTime.now();
  TimerOfAll(String time) {
    this.time = time;
    List listWait = time.split(':');
    DateTime date = new DateTime(now.year, now.month, now.day,
        int.parse(listWait[0]), int.parse(listWait[1]), int.parse(listWait[2]));

    _startTimer(date);
  }

  void _startTimer(DateTime date) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        Duration difference = date.difference(DateTime.now());
        if (difference.inSeconds > 0) {
          print(difference.inSeconds);
          // _counter--;
        } else {
          _timer.cancel();
        }
      },
    );
  }
}

void main() {
  TimerOfAll timerOfAll = TimerOfAll('23:59:60');
}
