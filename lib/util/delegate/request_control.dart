import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:dio/dio.dart';

bool isSuccess(int statusCode) {
  if (statusCode > 199 && statusCode < 300) {
    return true;
  } else {
    eeee("response status code: ${statusCode}");
    return false;
  }
}

extension MyRequest on Response {


  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
   bool isResponseSuccess(Response response) {
    if (response.statusCode! > 199 && response.statusCode! < 300) {
      return true;
    } else {
      eeee("response status code: ${response.statusCode}");
      return false;
    }
  }
}
