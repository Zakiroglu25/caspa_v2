import 'package:flutter/foundation.dart';

abstract class Configs {
  static const sentryDsn =
      'https://dd4de6d08af445f1bec7557973819d1b@o1102434.ingest.sentry.io/6128687';
  static const enableLogging = kDebugMode;
  static const baseUrl = 'https://caspa.az/api/';

  static const enableSentry = kReleaseMode;
}