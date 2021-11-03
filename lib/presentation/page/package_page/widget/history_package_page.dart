import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPackage extends StatefulWidget {
  const HistoryPackage({Key? key}) : super(key: key);

  @override
  _HistoryPackageState createState() => _HistoryPackageState();
}

class _HistoryPackageState extends State<HistoryPackage> {
  List<HistoryListModel> hList = [
    HistoryListModel(true, "Massimo Dutti", "27.08.2020", 86.46),
    HistoryListModel(false, "Pull and Bear", "27.07.2020", 86.46),
    HistoryListModel(true, "Zara", "27.08.2021", 86.46),
    HistoryListModel(false, "H&M", "27.08.2021", 86.46),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: hList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 78,
              decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  MySizedBox.w20,
                  if (hList[index].payment == true)
                    SvgPicture.asset("assets/svg/check.svg"),
                  if (hList[index].payment == false)
                    SvgPicture.asset("assets/svg/minus.svg"),
                  MySizedBox.w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hList[index].shopName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      MySizedBox.h4,
                      Text(
                        hList[index].date.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: MyColors.textFieldLittleText,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    hList[index].price.toString() + "TL",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  MySizedBox.w20
                ],
              ),
            ),
          );
        });
  }
}

class HistoryListModel {
  bool? payment;
  String? shopName;
  String? date;
  double? price;

  HistoryListModel(this.payment, this.shopName, this.date, this.price);
}