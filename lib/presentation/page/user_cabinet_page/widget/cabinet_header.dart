import 'package:caspa_v2/presentation/page/user_cabinet_page/widget/user_id.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_photo.dart';
import 'user_name.dart';

class CabinetHeaderWidget extends StatelessWidget {
  const CabinetHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorfullBackImage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySizedBox.h32,
          ProfilePhoto(),
          MySizedBox.h16,
          UserName(),
          MySizedBox.h16,
          UserID(),

          ///user elave et buttonu
          // CupertinoContextMenu(
          //   actions: [
          //     CupertinoContextMenuAction(
          //       onPressed: (){
          //         Navigator.pop(context);
          //       },
          //       isDefaultAction: true,
          //       child: SizedBox(
          //         width:300,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text(
          //               "Yeni profil əlavə et",
          //               style:
          //               AppTextStyles.sanF500.copyWith(
          //                   color: MyColors.black34, fontSize: 14.sp),
          //             ),
          //             Icon(Icons.add)
          //           ],
          //         ),
          //       )
          //     )
          //   ],
          //   child: Container(
          //     width: 160,
          //     height: 44,
          //     decoration: BoxDecoration(
          //       color: MyColors.black34,
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         SvgPicture.asset(
          //           Assets.svgUser,
          //           color: MyColors.white,
          //         ),
          //         MySizedBox.w12,
          //         Text(
          //           "Profili dəyiş" + "(2)",
          //           style:
          //               AppTextStyles.sanF500.copyWith(color: MyColors.white,fontSize: 14.sp),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
