
 import 'package:intl/intl.dart';

String getDate(int time){
print(time);
var date = DateTime.fromMillisecondsSinceEpoch(time);
String formattedDate = new DateFormat("dd MMMM yyyy").format(date);

return formattedDate;
}
