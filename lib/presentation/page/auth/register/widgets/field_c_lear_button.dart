import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FieldCLearButton extends StatefulWidget {
  String value;
  Function? onTap;
  TextEditingController? controller;
  Widget? elseChild;


  FieldCLearButton(this.value, {this.onTap,this.controller,this.elseChild});

  FieldCLearButton.elseEmpty(this.value, {this.onTap,this.controller,this.elseChild =MySizedBox.h0});
  FieldCLearButton.calendar(this.value, {this.onTap,this.controller,this.elseChild =MySizedBox.h0});

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

            if (widget.controller!=null) {
              widget.controller!.text='';
            }

            widget.onTap?.call();
          },
        ),
      ),
      elseChild:widget. elseChild ??SvgPicture.asset(Assets.svgCalendar) ,
    );
  }
}
