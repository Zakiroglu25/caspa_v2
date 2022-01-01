import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FieldCLearButton extends StatefulWidget {
  String value;
  Function? onTap;


  FieldCLearButton(this.value, {this.onTap});

  @override
  State<FieldCLearButton> createState() => _FieldCLearButtonState();
}

class _FieldCLearButtonState extends State<FieldCLearButton> {
  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: (widget.value!= ''),
      child: Material(
        color: Colors.transparent,
        child: GestureDetector(
          child: CircleAvatar(
            //radius: 20,
              maxRadius: 15,
              backgroundColor: MyColors.grey226,
              child: Icon(
                Icons.clear,
                size: 18,
                color: MyColors.black,
              )),
          onTap: () {
            setState(() {
              widget.value='';
            });

            widget.onTap?.call();
          },
        ),
      ),
      elseChild: SvgPicture.asset(Assets.svgCalendar) ,
    );
  }
}
