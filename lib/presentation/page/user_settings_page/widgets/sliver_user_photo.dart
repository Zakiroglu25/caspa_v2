import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/profile_photo.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'store_delegate.dart';

class SliverUserPhoto extends StatelessWidget {
  const SliverUserPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StoreDelegate(
        minHeight: 125,
        maxHeight: 125,
        child: Container(
          color: MyColors.white,
          padding: Paddings.paddingH16,
          height: 125,
          child: Center(
            child: ProfilePhoto(editable: true,),
          ),
        ),
      ),
    );
  }
}
