import 'package:intl/intl.dart';

String timeConvert(int value,int timeOffset){
  DateTime sunriseDateTime = DateTime.fromMillisecondsSinceEpoch(
            value * 1000,
            isUtc: true)
        .add(Duration(seconds: timeOffset));
        String formatted = DateFormat('hh:mm a').format(sunriseDateTime);
  return formatted;
}