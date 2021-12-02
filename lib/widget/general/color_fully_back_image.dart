import 'package:caspa_v2/presentation/page/order_success_page/widgets/congrats_text.dart';
import 'package:caspa_v2/presentation/page/order_success_page/widgets/order_on_the_way_text.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorfullBackImage extends StatelessWidget {
  String? path;
  double? w;
  double? h;
  String? title;
  String? infoTitle;
  String? infoContent;

  ColorfullBackImage(
      {required this.path,
      this.title,
      this.h,
      this.w,
      this.infoContent,
      this.infoTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetOrEmpty(
          value: title != null,
          child: Text(
            title??'',
            style: AppTextStyles.coHead400.copyWith(fontSize: 25),
          ),
        ),
        Center(
          child: Stack(alignment: Alignment.center,
            children: [
              Container(
                width: w ?? 355.sp, // MediaQuery.of(context).size.width,
                height: h ?? 355.sp, //MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.pngColorfulBack),
                  ),
                ),
              ),
              Container(
                height: 210.sp,
                width: 210.sp,
                child: Image.asset(
                  path!,
                ),
              ),
            ],
          ),
        ),
       // MySizedBox.h16,
        Container(
          child: WidgetOrEmpty(
              value: (infoTitle != null || infoContent != null),
              child: ColorfullyBackImageInfo(
                infoTitle: infoTitle,
                infoContent: infoContent,
              )),
        ),
      ],
    );
  }
}
