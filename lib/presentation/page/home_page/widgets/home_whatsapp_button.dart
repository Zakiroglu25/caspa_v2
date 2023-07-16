import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/screen/alert.dart';
import '../../../../widget/custom/fab/fab_animation.dart';

class HomeWhatsappWidget extends StatelessWidget {
  const HomeWhatsappWidget({
    Key? key,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: ScrollingFabAnimation(
          width: 137,
          height: 56,
          radius: 100,
          color: MyColors.wpColor,
          icon: SvgPicture.asset(Assets.svgMiniWhatsapp),
          scrollController: _scrollController,
          text: Container(
            padding: EdgeInsets.only(right: 12),
            child: Text(
              MyText.whatsapp,
              style: AppTextStyles.sanF500
                  .copyWith(color: MyColors.white, fontSize: 14.sp),
            ),
          ),

          onPress: () =>
              launch('https://api.whatsapp.com/send?phone=994997261453'),
          inverted: false,
          animateIcon: false,
          elevation: 0,
          // onPress: () {  },
        ),
      ),
    );
  }
}
