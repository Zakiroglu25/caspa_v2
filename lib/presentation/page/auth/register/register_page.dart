import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/caspa_drop_down.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';

import 'widgets/business_register_page.dart';
import 'widgets/civil_register_page.dart';
import 'widgets/drop_down_male.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {


  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: 'Qeydiyyat',
        //back: true,
        notification: false,
        centerTitle: true,
        contextA: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  9.0,
                ),
                color: MyColors.mainColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: MyColors.grey153,
              tabs: const [
                Tab(
                  text: 'Vətəndaş qeydiyyatı',
                ),
                Tab(
                  text: 'Bizness qeydiyyat',
                ),
              ],
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CivilRegisterPage(),
                  BusinessRegisterPage(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
