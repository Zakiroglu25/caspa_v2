import 'package:flutter/services.dart';

class LowerCaseInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: "${newValue.text.toLowerCase()}",
      selection: newValue.selection,
    );
  }
}
