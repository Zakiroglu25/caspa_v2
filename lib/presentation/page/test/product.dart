// import 'package:flutter/material.dart';
//
//
// class TestForm extends StatefulWidget {
//   @override
//   _TestFormState createState() => _TestFormState();
// }
//
// class _TestFormState extends State<TestForm> {
//   GlobalKey<FormState> _formKey = GlobalKey();
//
//   int _value1 = 0;
//   int _value2 = 20;
//   int _total = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     print('rebuild');
//     return Scaffold(
//       appBar: AppBar(title: Text('test form')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               TextFormField(
//                 initialValue: _value1.toString(),
//                 decoration: InputDecoration(
//                   labelText: 'Value_1',
//                 ),
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   setState(() {
//                     _total = int.parse(value) * _value2;
//                     print('total: ' + _total.toString());
//                   });
//                 },
//               ),
//               TextFormField(
//                 initialValue: _value2.toString(),
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Value_2',
//                 ),
//               ),
//               TextFormField(
//                 initialValue: _total.toString(),
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Total',
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text('total: ' + _total.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }