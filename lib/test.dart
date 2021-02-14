import 'package:cron/cron.dart';

main() {
  var cron = new Cron();
  cron.schedule(new Schedule.parse('37 0 * * *'), () async {
    print('every minutes');
  });
  cron.schedule(new Schedule.parse('8-11 * * * *'), () async {
    print('between every 8 and 11 minutes');
  });
}
