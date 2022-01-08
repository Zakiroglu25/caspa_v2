import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter({this.with994=true});

    bool with994 ;



  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {

    if (!oldValue.text.contains("(") &&
        oldValue.text.length >= (with994? 10:11 )&&
        newValue.text.length != oldValue.text.length) {
      return TextEditingValue(
        text: "-",
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if(oldValue.text.length>newValue.text.length){
      return TextEditingValue(
        text: newValue.text.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );
    }

    var newText = newValue.text;
    if (newText.length == 1) newText ="(" + newText;
    if (newText.length == (with994? 3:4 )) newText = newText + ") ";
    if (newText.length == (with994? 8:9 )) newText = newText + " ";
    if (newText.length == (with994? 11:12 )) newText = newText + " ";

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}