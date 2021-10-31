import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

import 'widgets/news_section.dart';
import 'widgets/section_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> hList = [
    // NewsModel(Image.asset("assets/png/news1.pg"),"Catdirilma",),
    // NewsModel(Image.asset("assets/png/news1.pg"),"Catdirilma",),
    NewsModel(
      Image.asset("assets/png/news1.pg"),
      "Catdirilma",
    ),
    NewsModel(
      Image.asset(Assets.news1),
      "3 gün ərzində çatdırılma",
    ),
    NewsModel(
      Image.asset(Assets.news2),
      "Sürətli küryer xidmətləri",
    ),
    NewsModel(
      Image.asset(Assets.news3),
      "Catdirilma",
    ),
    NewsModel(
      Image.asset(Assets.news1),
      "3 gün ərzində çatdırılma",
    ),
    NewsModel(
      Image.asset(Assets.news2),
      "Sürətli küryer xidmətləri",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bckColor,
      appBar: AppBar(
        backgroundColor: MyColors.bckColor,
        elevation: 0,
        leading: Icon(Icons.person),
        title: Text("User Name"),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 19.0),
            child: Icon(Icons.add_alert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ListView(
          children: [
            Text(
              "Xoş gəlmisiniz",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: MyColors.textBlack),
            ),
            Container(
              width: 120,
              height: 120,
              child: Image.asset(Assets.homeDino),
            ),
            MySizedBox.h16,
            Text(
              "Çatdırılmanı bizdən edin",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MyColors.textBlack),
            ),
            MySizedBox.h16,
            Text(
              MyText.homePageText,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: MyColors.textFieldLittleText),
            ),
            MySizedBox.h14,
            CaspaButton(
              w: 156,
              h: 44,
              textSize: 14,
              text: 'Çatdırılma istəyirəm',
            ),
            MySizedBox.h24,
            SectionName(title: "Yeniliklər və xəbərləri izləyin"),
            MySizedBox.h16,

            Container(
                height: 94,
                width: 94,
                child: ListView.builder(
                  itemCount: hList.length,
                  physics: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          Image.asset(Assets.news1),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Text(
                              "${hList[index].newsText}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class NewsModel {
  Image image;
  String? newsText;

  NewsModel(
    this.image,
    this.newsText,
  );
}
