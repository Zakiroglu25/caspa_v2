import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/elements/tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TarifListWidget extends StatelessWidget {
  const TarifListWidget({
    Key? key,
    required this.hList,
  }) : super(key: key);

  final List<TarifModel> hList;

  @override
  Widget build(BuildContext context) {
    List<TarifModel> hList = [
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
      TarifModel("0.001 - 0.10 kq qədər", 0.95),
    ];
    return Container(
      height: 132,
      width: 284,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return MySizedBox.w10;
        },
        itemCount: hList.length,
        scrollDirection: Axis.horizontal,
        padding: Paddings.paddingH20,
        itemBuilder: (context, index) {
          return TariffCard(
            tarifName: hList[index].tarifName,
            price: hList[index].price,
          );
        },
      ),
    );
  }
}

class TarifModel {
  String? tarifName;
  double? price;

  TarifModel(
    this.tarifName,
    this.price,
  );
}
