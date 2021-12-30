import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LoggingService {
  LoggingService._();

  static LoggingService? _instance;

  static final logHistory = <String>[];

  factory LoggingService([bool enablePrinter = false]) {
    if (_instance == null) {
      _instance = LoggingService._();
      Logger.root.level = Level.ALL;

      Logger.root.onRecord.listen(
        (logRecord) => _printLog(logRecord, enablePrinter),
      );
    }

    return _instance!;
  }

  static void _printLog(LogRecord logRecord, [bool enablePrinter = false]) {
    final logMessage = '${logRecord.level} => ${logRecord.loggerName}: '
        '${logRecord.message}';
    _addToLogHistory(logMessage);

    if (enablePrinter) {
      debugPrint(logMessage);
    }
  }

  static void _addToLogHistory(String log) {
    if (logHistory.length == 20) {
      logHistory.removeAt(0);
    }

    logHistory.add(log);
  }
}
