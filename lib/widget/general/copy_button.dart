import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CopyButton extends StatelessWidget {
  String? data;
  double? h;
  double? w;
  Color? color;


  CopyButton(this.data,{this.w,this.h,this.color});

  @override
  Widget build(BuildContext context) {
    return                   InkWrapper(

      onTap: ()=>StringOperations.copy(data!, context),
      child: SizedBox(



          width:w?? 20,
          height:h?? 20,
          child: SvgPicture.asset(
            Assets.svgCopy,
            color: color?? MyColors.grey153,
          )),
    )
;
  }
}
