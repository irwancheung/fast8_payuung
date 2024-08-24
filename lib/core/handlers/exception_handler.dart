import 'package:equatable/equatable.dart';
import 'package:fast8_payuung/global_vars.dart';

class AppException extends Equatable implements Exception {
  final String message;
  final String? reason;
  final String? action;
  final Object? e;
  final StackTrace? s;

  const AppException(this.message, {this.reason, this.action, this.e, this.s});

  @override
  List<Object?> get props => [message];
}

class ExceptionHandler {
  const ExceptionHandler();

  AppException handle(Object? e, StackTrace s) {
    appLogger.e(e ?? Exception('unknown_error'), s);

    final String message = e is String ? e : 'Terjadi kesalahan';

    return AppException(message, e: e, s: s);
  }
}
