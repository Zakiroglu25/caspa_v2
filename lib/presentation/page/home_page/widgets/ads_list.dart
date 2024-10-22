import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/ads_card.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/strory_ads.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidget extends StatelessWidget {
  final List<Data>? hList;
  bool? isVertical;

  AdsWidget({
    Key? key,
    required this.hList,
    this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;
    return FadeIn(
      child: SizedBox(
        height: 94.sp,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return MySizedBox.w10;
          },
          shrinkWrap: true,
          itemCount: hList!.length,
          scrollDirection: Axis.horizontal,
          padding: Paddings.paddingH20,
          itemBuilder: (context, index) {
            Data ads = hList![index];
            return InkWrapper(
              onTap: () => Go.to(
                  context,
                  MoreStories(
                    hList: hList!,
                  )),
              child: AdsCard(
                desc: ads.title,
                url: ads.image,
                //w: (isVertical ?? false) ? null : 284.sp,
              ),
            );
          },
        ),
      ),
    );
  }
}
