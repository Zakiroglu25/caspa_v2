



import 'package:caspa_v2/presentation/page/package_page/widget/sliver_appbar_delegate.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/copiable_field.dart';

class SilverAppBarExample extends StatefulWidget {
  @override
  State<SilverAppBarExample> createState() => _SilverAppBarExampleState();
}

class _SilverAppBarExampleState extends State<SilverAppBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CaspaAppbar(title: "jghjk",contextA: context,
      back: false,),
      body: DefaultTabController(
        length: 1,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 250.0,
              floating: true,
              pinned: false,
              snap: true,
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ünvanlar",
                          style: TextStyle(fontSize: 25),
                        ),
                        Image.asset("assets/png/globuspng.png"),
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: Text(
                              "Hörmətli müştəri, əlavə məlumat əldə etmək üçün qaynar xətt: *1453"),
                        ),
                      ],
                    ),
                  )),
            ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: SliverAppBarDelegate(
                TabBar(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
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
                      text: 'Türkiyə',
                    ),
                    Tab(
                      text: 'Türkiyə',
                    ),
                  ],
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(buildList(1))),
          ],
        ),
      ),
    );
  }

  buildList(int count) {
    List<Widget>? listItems = [];

    for (int i = 0; i < count; i++) {
      listItems.add(Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CopiableField(
              title: "İsim",
              data: "Bahtiyar",
            ),
            CopiableField(
              title: "Soy isim",
              data: "Bahtiyarli",
            ),
            CopiableField(
              title: "İlçe",
              data: "Ataşehir",
            ),
            CopiableField(
              title: "Adres satır 1",
              data: "İnönü Cad.no:9/3, Yeni Sahra BN:f7fe27 34746  C111141",
            ),
            CopiableField(
              title: "İl:",
              data: "İstanbul ",
            ),
            CopiableField(
              title: "Mahalle",
              data: "Yenisahra",
            ),
            CopiableField(
              title: "Telefon:",
              data: "05437750818",
            ),
            CopiableField(
              title: "Tc kimlik:",
              data: "31583104656",
            ),
            CopiableField(
              title: "Posta Kodu:",
              data: "34746",
            ),
            CopiableField(
            //  maxLines: 1,
              title: "Adres Başlığı:",
              data: "CASPA bhjb dfjsnjkdgnjkdfg jfskjdgfhjkdgf skjfshjkgdfhjfbkjfskjdgfhjkdgfjfskjdgfhjkdgfjfskjdgfhjkdgf jfskjdgfhjkdgf",
            ),
            MySizedBox.h100
          ],
        ),
      ));
    }

    return listItems;
  }
}