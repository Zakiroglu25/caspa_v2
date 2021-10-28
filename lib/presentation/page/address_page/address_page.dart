import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/copiable_field.dart';

class SilverAppBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CaspaAppbar(),
      body: CustomScrollView(
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
          SliverList(delegate: SliverChildListDelegate(buildList(1))),
        ],
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
            Container(
              width: 110,
              height: 45,
              decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(12)),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                scrollDirection: Axis.horizontal,
                children: [
                  Text("Türkiyə"),
                ],
              ),
            ),
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
              maxLines: 2,
              data: "İnönü Cad.no:9/3, Yeni Sahra BN:f7fe27 34746  C111141",
            ),
            CopiableField(
              title: "İl:",
              data: "İstanbul ",
            ),
            CopiableField(
              maxLines: 1,
              title: "Mahalle",
              data: "Yenisahra",
            ),
            CopiableField(
              maxLines: 1,
              title: "Telefon:",
              data: "05437750818",
            ),
            CopiableField(
              maxLines: 1,
              title: "Tc kimlik:",
              data: "31583104656",
            ),
            CopiableField(
              maxLines: 1,
              title: "Posta Kodu:",
              data: "34746",
            ),
            CopiableField(
              maxLines: 1,
              title: "Adres Başlığı:",
              data: "CASPA",
            ),
            MySizedBox.h100
          ],
        ),
      ));
    }

    return listItems;
  }
}
