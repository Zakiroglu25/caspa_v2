import 'package:caspa_v2/infrastructure/cubits/bonus_cubit/bonus_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/bonus_cubit/bonus_state.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../infrastructure/models/remote/response/bonus_model.dart';
import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/assets.dart';
import '../../../util/constants/paddings.dart';
import 'widget/bonus_list.dart';
import 'widget/bottom_container_bonus_widget.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bonus,
      appBar: CaspaAppbar(
        color: MyColors.bonus,
        user: false,
        title: "",
        notification: false,
        actions: false,
        contextA: context,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MySizedBox.h40,
          Text(
            "Bonuslar",
            style: AppTextStyles.coHead400.copyWith(fontSize: 20),
          ),
          MySizedBox.h26,
          Container(
            width: 130,
            height: 62,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromRGBO(0, 0, 0, 0.05)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _prefs.user.bonus.toString() + " \$",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                Text(
                  "Cəmi balans",
                  style: AppTextStyles.sanF400
                      .copyWith(fontSize: 12.sp, color: MyColors.grey153),
                ),
              ],
            ),
          ),
          Spacer(),
          BottomConyainerBonus(),
        ],
      ),
    );
  }
}
