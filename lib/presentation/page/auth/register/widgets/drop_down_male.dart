import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

class DropDownGender extends StatefulWidget {
  const DropDownGender({Key? key}) : super(key: key);

  @override
  _DropDownGenderState createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  String? _gender;
  List<String>? _genderList = ['Kişi', 'Qadın'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 14.0, right: 14.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: MyColors.mainGrey,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            hint: Text('Cinsiyyət'),
            // Not necessary for Option 1
            //  value: _selectedLocation,
            value: _gender,
            // ??
            // StringOperations.genderConvertFromId(widgets.genderId),

            onChanged: (newValue) {
              setState(() {
                _gender = newValue.toString();
              });
            },
            //  focusNode: _focusNodeGender,
            items: _genderList!.map((gender) {
              return DropdownMenuItem(
                child: Container(
                    // width: sW/4,
                    child: new Text(gender)),
                value: gender,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
