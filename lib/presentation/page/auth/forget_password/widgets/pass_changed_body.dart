import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_main_text.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/widgets/forgot_second_text.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PassChangedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySizedBox.h30,
        Flash(child: ForgotMainText(MyText.setted_new_pass)),
        MySizedBox.h16,
        ForgotSecondText(MyText.we_have_sent_new_pass_email),
        MySizedBox.h16,
        Container(
            height: 200.sp,
            width: 200.sp,
            child: Lottie.asset(Assets.animSuccessOpt, repeat: false))
      ],
    );
  }
}
