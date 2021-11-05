import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ümumi məlumat",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.textBlack),
          ),
          MySizedBox.h10,
          const Text(
            "Mağazanın adı",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.textFieldLittleText),
          ),
          const Text(
            "Massimo dutti",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MyColors.textBlack),
          ),
          MySizedBox.h20,
          const Text(
            "Qiymət",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.textFieldLittleText),
          ),
          const Text(
            "764 TL",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MyColors.textBlack),
          ),
          MySizedBox.h20,
          const Text(
            "İzləmə kodu",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.textFieldLittleText),
          ),
          const Text(
            "252442",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MyColors.textBlack),
          ),
          MySizedBox.h20,
          const Text(
            "Status",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.textFieldLittleText),
          ),
          Row(
            children: const [
              MySizedBox.w5,
              Icon(
                Icons.circle,
                size: 12,
                color: Color.fromRGBO(242, 187, 68, 1),
              ),
              MySizedBox.w12,
              Text(
                "Yoldadır",
                style: TextStyle(
                    fontFamily: "San Francisco",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textBlack),
              ),
            ],
          ),
          MySizedBox.h20,
          const Text(
            "Məhsulun sayı",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.textFieldLittleText),
          ),
          const Text(
            "4",
            style: TextStyle(
                fontFamily: "San Francisco",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: MyColors.textBlack),
          )
        ],
      ),
    );
  }
}
