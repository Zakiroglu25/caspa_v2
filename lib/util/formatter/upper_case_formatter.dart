import 'package:flutter/services.dart';

class UpperCaseFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.length > 0
          ? "${newValue.text[0].toUpperCase()}${newValue.text.substring(1)}"
          : "",
      selection: newValue.selection,
    );
  }
}
