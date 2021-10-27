import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/simple_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
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
      appBar: CaspaAppbar(title: 'Qeydiyyat',back: true,notification: false, contextA: null,),
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
                unselectedLabelColor: MyColors.textFieldLittleText,
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
                children:  [
                  Padding(
                    padding: const EdgeInsets.only(left:16.0,top: 40,right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ad"),
                        CaspaField(
                          hint: 'Adınızı daxil edin',
                        ),
                      ],
                    ),
                  ),

                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}