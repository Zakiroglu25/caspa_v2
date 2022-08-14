import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/screen/ink_wrapper.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: InkWrapper(
        onTap: () => Go.to(context, Pager.selectPackagesPayPage()),
        child: Container(
          width: 129,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.10),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
            color: MyColors.black34,
          ),
          child: Padding(
            padding: Paddings.paddingA16,
            child: Center(
              child: Text(
                MyText.totalPayX,
                style: AppTextStyles.sanF500
                    .copyWith(color: MyColors.white, fontSize: 14.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
