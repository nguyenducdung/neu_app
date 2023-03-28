import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(dynamic value) {
    final formatter = NumberFormat("#,###", "vi_VN");
    return formatter.format(value);
  }
}

class DecimalFormatter {
  static String format(dynamic value) {
    final formatter = NumberFormat("#,###.##", "vi_VN");
    return formatter.format(value);
  }
}
