import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TariffCard extends StatelessWidget {
  String? tarifName;
  double? price;


  TariffCard({this.tarifName, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.mainGrey),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(Assets.tarifBox),
            Text(
              tarifName!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(price.toString() + "USD",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green))
          ],
        ),
      ),
    );
  }
}
