import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/ads_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/ads_details_screen.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/news_section.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'news_list_widget.dart';
import 'tariff_details.dart';

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
        height: 120.sp,
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
            return InkWell(
              onTap: () {
                Go.to(
                    context,
                    AdsDetailsPage(
                      hList: hList![index],
                    ));
              },
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
