import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'tariff_details.dart';

class TarifListWidget extends StatelessWidget {
  final List<Tariff> hList;
   bool? isVertical;

  TarifListWidget({
    Key? key,
    required this.hList,
    this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    isVertical ??= false;
    return FadeIn(
      child: SizedBox(
        height: isVertical!? null:92.sp,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return isVertical!?MySizedBox.h16: MySizedBox.w10;
          },
          shrinkWrap: true,
          primary: false,
          itemCount: hList.length,
          scrollDirection: isVertical! ? Axis.vertical:Axis.horizontal,
          padding: Paddings.paddingH20,
          itemBuilder: (context, index) {
            Tariff tariff = hList[index];
            return FadeInUp(
              duration: Duration(milliseconds: isVertical!?AppOperations.getTime(index):0),
              child: TariffCard(
                tarifName: tariff.description,
                price: tariff.price,
                isVertical: isVertical,
                type: tariff.type,
                //w: (isVertical ?? false) ? null : 284.sp,
              ),
            );
          },
        ),
      ),
    );
  }
}
