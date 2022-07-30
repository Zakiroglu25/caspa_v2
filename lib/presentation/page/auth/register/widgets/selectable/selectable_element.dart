import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/local/gender.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/enums/gender_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectableGender extends StatelessWidget {
  Gender? gender;
  Function? onTap;
  GenderType? selectedGenderType;

  SelectableGender({Key? key, this.gender, this.onTap, this.selectedGenderType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              gender!.title!,
              style: TextStyle(
                  color: selectedGenderType == gender!.type
                      ? MyColors.mainColor
                      : Colors.black),
            ),
            selectedGenderType == gender!.type
                ? FlipInY(
                    duration: Duration(milliseconds: 500),
                    child: Icon(
                      FontAwesomeIcons.checkCircle,
                      size: 15,
                      color: MyColors.mainColor,
                    ))
                : Container()
          ],
        ),
      ),
      onTap: () {
        onTap?.call();
      },
    );
  }
}
