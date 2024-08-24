import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

class Logger {
  // Bloc
  void b(Object message) {
    if (!kReleaseMode) {
      const color = '\x1B[36m';
      _log(message: message, color: color);
    }
  }

  // Debug
  void d(Object message) {
    if (!kReleaseMode) {
      const color = '\x1B[33m';
      _log(message: message, color: color);
    }
  }

  // Info
  void i(Object message) {
    if (!kReleaseMode) {
      const color = '\x1B[34m';
      _log(message: message, color: color);
    }
  }

  // Error
  void e(Object error, [StackTrace? stackTrace]) {
    const color = '\x1B[31m';

    _log(message: error, stackTrace: stackTrace, color: color);
  }

  void _log({
    required Object message,
    StackTrace? stackTrace,
    required String color,
  }) {
    final frame = stack_trace.Trace.current(2).terse.frames[0];

    log('$color────────────────────────────────────────────────────────────────────────────────────');
    log('$color${DateTime.now()}');
    log('$color$message');
    log('$color${stackTrace ?? frame}');
  }
}
