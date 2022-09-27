import 'package:caspa_v2/util/delegate/my_printer.dart';

extension IntExtension on int? {
  bool get isSuccess {
    if (this != null) {
      if (this! > 199 && this! < 300) {
        return true;
      } else {
        eeee("response status code: ${this}");
        return false;
      }
    } else {
      eeee("response status code: is null}");
      return false;
    }
  }
}
