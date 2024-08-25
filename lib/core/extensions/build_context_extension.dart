import 'package:fast8_payuung/exports.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(
    String message, {
    Color? textColor,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w400,
              height: 1.43.h,
            ),
          ),
          backgroundColor: backgroundColor ?? textColor,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 3000),
          showCloseIcon: true,
        ),
      );
  }

  void showSuccessSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: const Color(0xff389c96),
    );
  }

  void showErrorSnackBar(String message) {
    showSnackBar(
      message,
      backgroundColor: Colors.red,
    );
  }
}
