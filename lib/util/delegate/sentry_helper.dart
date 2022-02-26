// import 'package:caspa_v2/infrastructure/services/logging_service.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
//
//
// class SentryHelper {
//   const SentryHelper._();
//
//   static Future<void> captureException(
//       Object e, {
//         String? message,
//         StackTrace? stackTrace,
//       }) async {
//     await Sentry.captureMessage(
//       message ?? e.toString(),
//       level: SentryLevel.error,
//       params: LoggingService.logHistory,
//     );
//   }
// }