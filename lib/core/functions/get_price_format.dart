import 'package:intl/intl.dart';

String getPriceFormat(int number) {
  return NumberFormat("#,##0").format(number);
}
