
import 'package:neu_app/utils/currency_formatter.dart';

extension StringExtra on String? {
  String removeAccents() {
    if (this == null || this?.isEmpty == true) {
      return '';
    }
    return this
            ?.replaceAll(RegExp('à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'), "a")
            .replaceAll(RegExp("è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ"), "e")
            .replaceAll(RegExp("ì|í|ị|ỉ|ĩ"), "i")
            .replaceAll(RegExp("ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ"), "o")
            .replaceAll(RegExp("ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ"), "u")
            .replaceAll(RegExp("ỳ|ý|ỵ|ỷ|ỹ"), "y")
            .replaceAll(RegExp("đ"), "d")
            .replaceAll(RegExp("À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ"), "A")
            .replaceAll(RegExp("È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ"), "E")
            .replaceAll(RegExp("Ì|Í|Ị|Ỉ|Ĩ"), "I")
            .replaceAll(RegExp("Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ"), "O")
            .replaceAll(RegExp("Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ"), "U")
            .replaceAll(RegExp("Ỳ|Ý|Ỵ|Ỷ|Ỹ"), "Y")
            .replaceAll(RegExp("Đ"), "D") ??
        '';
  }
}

extension DoubleExtra on double? {
  String formatCurrency() {
    if (this == null || this == 0.0) {
      return '0đ';
    }
    return '${CurrencyFormatter.format(this)}đ';
  }

  String formatCurrencyWithoutSymbol() {
    if (this == null || this == 0.0) {
      return '0';
    }
    return CurrencyFormatter.format(this);
  }

  String formatDecimal() {
    if (this == null || this == 0.0) {
      return '0';
    }
    return DecimalFormatter.format(this);
  }
}

extension PnLExtension on double {
  String toPnLString() {
    String prefix = this >= 0 ? '+' : '-';
    String percent = abs().toStringAsFixed(2);
    return '$prefix$percent%';
  }
}

extension IntExtra on int? {
  String formatCurrency() {
    if (this == null || this == 0) {
      return '0đ';
    }
    return '${CurrencyFormatter.format(this)}đ';
  }
}
