import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class PhoneMaskFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     //Phone Mask: +X (XXX) XXX-XXXX
//
//     //While deleting character get the older value to check if you're deleting not number characters
//     final oldValueText = oldValue.text.replaceAll(new RegExp(r'[^0-9]'), '');
//     String newValueText = newValue.text;
//
//     //If its same its because you're deleting a non number value so remove the value that you want to delete
//     if (oldValueText == newValue.text) {
//       newValueText = newValueText.substring(0, newValue.selection.end - 1) +
//           newValueText.substring(newValue.selection.end, newValueText.length);
//     }
//
//     final int newTextLength = newValueText.length;
//
//     int selectionIndex = newValue.selection.end;
//     int usedSubstringIndex = 0;
//     final StringBuffer newText = StringBuffer();
//
//     if (newTextLength >= 1) {
//       newText.write(
//           '+' + newValueText.substring(0, usedSubstringIndex = 1) + ' (');
//       if (newValue.selection.end >= 1) selectionIndex += 3;
//     }
//     if (newTextLength > 4) {
//       newText.write(newValueText.substring(1, usedSubstringIndex = 4) + ') ');
//       if (newValue.selection.end >= 4) selectionIndex += 2;
//     }
//     if (newTextLength > 7) {
//       newText.write(newValueText.substring(4, usedSubstringIndex = 7) + '-');
//       if (newValue.selection.end >= 7) selectionIndex++;
//     }
//     // Dump the rest.
//     if (newTextLength >= usedSubstringIndex)
//       newText.write(newValueText.substring(usedSubstringIndex));
//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }

class MaskedTextController extends TextEditingController {
  MaskedTextController(
      {String? text, required this.mask, Map<String, RegExp>? translator})
      : super(text: text) {
    this.translator = translator ?? MaskedTextController.getDefaultTranslator();

    this.addListener(() {
      var previous = this._lastUpdatedText;
      if (this.beforeChange(previous, this.text)) {
        this.updateText(this.text);
        this.afterChange(previous, this.text);
      } else {
        this.updateText(this._lastUpdatedText);
      }
    });

    this.updateText(this.text);
  }
  MaskedTextController.app({String? text, this.mask = '(000)-000-00-00'})
      //yuxardaki format deyise profil editde de deyisiklik olunmalidir
      : super(text: text) {
    this.translator = translator ?? MaskedTextController.getDefaultTranslator();

    this.addListener(() {
      var previous = this._lastUpdatedText;
      if (this.beforeChange(previous, this.text)) {
        this.updateText(this.text);
        this.afterChange(previous, this.text);
      } else {
        this.updateText(this._lastUpdatedText);
      }
    });

    this.updateText(this.text);
  }
  String mask;

  Map<String, RegExp>? translator;

  Function afterChange = (String previous, String next) {};
  Function beforeChange = (String previous, String next) {
    return true;
  };

  String _lastUpdatedText = '';

  void updateText(String text) {
    if (text != null) {
      this.text = this._applyMask(this.mask, text);
    } else {
      this.text = '';
    }

    this._lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    this.updateText(this.text);

    if (moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    var text = this._lastUpdatedText;
    this.selection =
        new TextSelection.fromPosition(new TextPosition(offset: (text).length));
  }

  @override
  void set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      this.moveCursorToEnd();
    }
  }

  static Map<String, RegExp> getDefaultTranslator() {
    return {
      'A': new RegExp(r'[A-Za-z]'),
      '0': new RegExp(r'[0-9]'),
      '@': new RegExp(r'[A-Za-z0-9]'),
      '*': new RegExp(r'.*')
    };
  }

  String _applyMask(String mask, String value) {
    String result = '';

    var maskCharIndex = 0;
    var valueCharIndex = 0;

    while (true) {
      // if mask is ended, break.
      if (maskCharIndex == mask.length) {
        break;
      }

      // if value is ended, break.
      if (valueCharIndex == value.length) {
        break;
      }

      var maskChar = mask[maskCharIndex];
      var valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
        continue;
      }

      // apply translator if match
      if (this.translator!.containsKey(maskChar)) {
        if (this.translator![maskChar]!.hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
        continue;
      }

      // not masked value, fixed char on mask
      result += maskChar;
      maskCharIndex += 1;
      continue;
    }

    return result;
  }
}
