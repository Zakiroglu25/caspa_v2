// import 'package:caspa_v2/util/delegate/my_printer.dart';
// import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:intl/intl.dart';
// import 'package:pattern_formatter/numeric_formatter.dart';
// import 'widget/general/caspa_field.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(MyLApp());
//
// class MyLApp extends StatefulWidget {
//   @override
//   State<MyLApp> createState() => _MyLAppState();
// }
//
// class _MyLAppState extends State<MyLApp> {
//   late TextEditingController textEditingController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     textEditingController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final formatter = intl.NumberFormat.decimalPattern();
//     return MaterialApp(
//       title: 'Material App',
//       home: SafeArea(
//         child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 CaspaField(
//                   controller: textEditingController,
//                   textInputType: TextInputType.number,
//                   onChanged: (v) {
//                     final currencyFormatter = NumberFormat('#,##0.00', 'ID');
//                     textEditingController.text =
//                         currencyFormatter.format(num.tryParse(v));
//                   },
//                   formatters: [
//                     // ThousandsFormatter(allowFraction: true),
//                     DecimalTextInputFormatter()
//                     //FilteringTextInputFormatter.allow(RegExp(r"\d+([\,]\d+)?")),
//                   ],
//                 ),
//                 NumberFormatExample(),
//                 CaspaButton(
//                   onTap: () {
//                     bbbb("${textEditingController.text}");
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NumberFormatExample extends StatefulWidget {
//   @override
//   _NumberFormatExampleState createState() => new _NumberFormatExampleState();
// }
//
// class _NumberFormatExampleState extends State<NumberFormatExample> {
//   final formatter = intl.NumberFormat.decimalPattern();
//   double theValue = 12768734.666;
//
//   @override
//   Widget build(BuildContext context) {
//     return new Text(formatter.format(theValue));
//   }
// }
//
// class DecimalTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final regEx = RegExp('/^[0-9,.]*\$/');
//     String newString = regEx.stringMatch(newValue.text) ?? "";
//     String newText = newValue.text;
//     List<String> newParts = newText.split('.');
//     double d = 100286020524.17;
//     final currencyFormatter = NumberFormat('#,##0.00', 'ID');
//     //print(currencyFormatter.format(d));
//     if (newParts.length > 2) {
//       return oldValue;
//     } else if (newParts.length == 2) {
//       if (newParts[1].length > 2) {
//         return oldValue;
//       } else {
//         return newValue;
//       }
//     } else {
//       // //   newValue.text=currencyFormatter.format(newValue.text);
//       // TextEditingValue myValue = TextEditingValue(
//       //     text: currencyFormatter.format(num.tryParse(newValue.text)));
//       return newValue;
//     }
//     //return newString == newValue.text ? newValue : oldValue;
//   }
// }
//
// // class DecimalTextInputFormatter extends TextInputFormatter {
// //   @override
// //   TextEditingValue formatEditUpdate(
// //       TextEditingValue oldValue, TextEditingValue newValue) {
// //     // final regEx = RegExp(r"^\d*\.?\d*");
// //     // String newString = regEx.stringMatch(newValue.text) ?? "";
// //     newValue.Ztext = '34567';
// //     final currencyFormatter = NumberFormat('#,##0.00', 'ID');
// //     num? nW = num.tryParse(newValue.text);
// //     print(currencyFormatter.format(nW));
// //     final newString = currencyFormatter.format(nW);
// //     return newString == newValue.text ? newValue : oldValue;
// //   }
// // }
