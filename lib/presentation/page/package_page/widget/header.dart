import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';

import 'sliver_appbar_delegate.dart';

class SliverPersistentHeaderWidget extends StatelessWidget {

  SliverPersistentHeaderWidget({Key? key,this.tabController}) : super(key: key);
   late TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: SliverAppBarDelegate(
        TabBar(
          padding: EdgeInsets.only(left: 16,right: 16),
          controller: tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            color: MyColors.mainGrey,
          ),
          labelColor: MyColors.textBlack,
          unselectedLabelColor: MyColors.grey153,
          tabs: const [
            Tab(
              text: 'Gözləmədə olan',
            ),
            Tab(
              text: 'Tarixcə',
            ),
          ],
        ),
      ),
    );
  }
}
