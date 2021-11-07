import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusTab extends StatelessWidget {
   StatusTab({Key? key}) : super(key: key);

  List<StatusModel> hList = [
    StatusModel(
        1,
        "Xarici anbara bəyan et ",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.statusCheck,
        "assets/svg/shopping.svg",
        1),
    StatusModel(2, "Xarici anbarda", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.statusCheck, "assets/svg/world.svg", 1),
    StatusModel(
        3,
        "Smart Customs-a bəyan et ",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.statusCheck,
        "assets/svg/smartcustom.svg",
        1),
    StatusModel(4, "Yoldadır", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.statusWay, "assets/svg/shopping.svg", 2),
    StatusModel(5, "Gömrükdə", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.statusError, "assets/svg/shopping.svg", 3),
    StatusModel(
        6,
        "Caspa Baku ofisində",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.mainGrey,
        "assets/svg/coffee.svg",
        0),
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
                  color: hList[index].color,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  MySizedBox.w20,
                  if (hList[index].statusChanged == 0)
                    CircleAvatar(
                      radius: 14,
                      child: Text(
                        hList[index].statusNum.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'San Francisco'),
                      ),
                      backgroundColor: Colors.grey[500],
                    ),
                  if (hList[index].statusChanged == 1)
                    SvgPicture.asset('assets/svg/check.svg'),
                  if (hList[index].statusChanged == 2)
                    SvgPicture.asset('assets/svg/nida.svg'),
                  if (hList[index].statusChanged == 3)
                    SvgPicture.asset('assets/svg/minus.svg'),
                  MySizedBox.w16,
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hList[index].statusName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      MySizedBox.h4,
                      Text(
                        hList[index].statusSubTitle.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: MyColors.grey153,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                      hList[index].icon.toString()),
                  MySizedBox.w20
                ],
              ),
            ),
          );
        });
  }
}
class StatusModel {
  int? statusNum;
  String? statusName;
  String? statusSubTitle;
  Color? color;
  String? icon;
  int? statusChanged;

  StatusModel(this.statusNum, this.statusName, this.statusSubTitle, this.color,
      this.icon, this.statusChanged);
}