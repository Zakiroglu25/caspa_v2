
import 'package:caspa_v2/infrastructure/models/remote/response/tarif_response_model.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TarifListWidget extends StatelessWidget {
  final List<Tariff> hList;

   TarifListWidget({Key? key, required this.hList,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.sp,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return MySizedBox.w10;
        },
        shrinkWrap: true,
        itemCount: hList.length,
        scrollDirection: Axis.horizontal,
        padding: Paddings.paddingH20,
        itemBuilder: (context, index) {
          Tariff tariff = hList[index];
          return TariffCard(
            tarifName: tariff.description,
            price: tariff.price,
          );
        },
      ),
    );
  }
}
