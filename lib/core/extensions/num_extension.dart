import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension WidgetExtension on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
}

extension FormatExtension on num {
  String toCurrency({bool isNegative = false, bool showPlus = false}) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );

    final formatted = formatter.format(isNegative ? -this : this);

    return !isNegative && showPlus ? '+$formatted' : formatted;
  }
}
