import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';

import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/news_section.dart';
import 'widgets/package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tarif_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            HomeHeader(),
            MySizedBox.h24,
            SectionName(title: "Yeniliklər və xəbərləri izləyin"),
            MySizedBox.h16,
            NewsListWidget(hList: [],),
            MySizedBox.h24,
            SectionName(title: "Teriflərlə tanış olun",),
            MySizedBox.h16,
            TarifListWidget(hList: [],),
            MySizedBox.h24,
            SectionName(title: "Mənim bağlamalarim",),
            MySizedBox.h24,
            HomaPackageList(hList: [],),

          ],
        ),
      ),
    );
  }
}




