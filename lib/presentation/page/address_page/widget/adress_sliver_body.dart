import 'package:caspa_v2/presentation/page/address_page/widget/sliver_info.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class AdressSliverAppbarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 120, height: 120, child: Image.asset(Assets.pngGlobus)),
        SliverInfo(
            "Hörmətli müştəri, əlavə məlumat əldə etmək üçün qaynar xətt:")
      ],
    );
  }
}
