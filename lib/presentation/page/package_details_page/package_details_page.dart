import 'package:caspa_v2/presentation/page/package_page/widget/history_package_page.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({Key? key}) : super(key: key);

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  List<StatusModel> hList = [
    StatusModel(
        1,
        "Xarici anbara bəyan et ",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green,
        "assets/svg/minus.svg"),
    StatusModel(2, "Xarici anbarda", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green, "assets/svg/minus.svg"),
    StatusModel(
        3,
        "Smart Customs-a bəyan et ",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green,
        "assets/svg/minus.svg"),
    StatusModel(4, "Yoldadır", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green, "assets/svg/minus.svg"),
    StatusModel(5, "Gömrükdə", "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green, "assets/svg/minus.svg"),
    StatusModel(
        6,
        "Caspa Baku ofisində",
        "Bir sətirlik, müştəri üçün qısa məlumat.",
        MyColors.green,
        "assets/svg/minus.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24), topLeft: Radius.circular(24))),
          child: Column(
            children: [
              MySizedBox.h10,
              Container(
                width: 33,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100)),
              ),
              MySizedBox.h16,
              TabBar(
                  controller: _controller,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: MyColors.mainGrey,
                  ),
                  labelColor: MyColors.textBlack,
                  unselectedLabelColor: MyColors.textFieldLittleText,
                  tabs: const [
                    Tab(
                      text: 'Status',
                    ),
                    Tab(
                      text: 'Məlumat',
                    ),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    ListView.builder(
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
                                  // if (hList[index].status == 1)
                                  //   SvgPicture.asset("assets/svg/check.svg"),
                                  // if (hList[index].status == 2)
                                  //   SvgPicture.asset("assets/svg/minus.svg"),
                                  CircleAvatar(
                                    radius: 14,
                                    child: Text(hList[index].status.toString(),style: TextStyle(color: Colors.white),),
                                    backgroundColor: Colors.grey[500],
                                  ),
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
                                            color: MyColors.textFieldLittleText,
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
                        }),
                    Center(
                      child: Text(
                        "sagol",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusModel {
  int? status;
  String? statusName;
  String? statusSubTitle;
  Color? color;
  String? icon;

  StatusModel(
      this.status, this.statusName, this.statusSubTitle, this.color, this.icon);
}
