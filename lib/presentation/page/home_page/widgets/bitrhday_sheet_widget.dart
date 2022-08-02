import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/services/hive_service.dart';
import '../../../../locator.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';

class BirthdaySheet extends StatelessWidget {
  const BirthdaySheet({
    Key? key,
  }) : super(key: key);

  HiveService get _prefsLocale => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: ListView(
        children: [
          SizedBox(
            width: 375,
            height: 375,
            child: Image.asset(Assets.bottomBirthday),
          ),
          Padding(
            padding: Paddings.paddingH16,
            child: Column(
              children: [
                MySizedBox.h16,

                Text(
                  "Caspa Azerbaijan ailəsi səni təbrik edir, ${_prefsLocale.user.name} 🎉",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 25.sp),
                ),
                MySizedBox.h16,
                Text(
                  "Hörmətli müştəri! “Caspa.Az” olaraq, Sizi doğum günü münasibəti ilə təbrik edir, möhkəm can sağlığı arzulayırıq. Çox şadıq ki, vaxtı ilə məhz bizi seçdiniz, və bu gözəl gündə sizə özəl bir promokod hediyyemiz var elde etmek ucun *1453 elaqə saxlaya bilərsini Doğum gününüz mübarək!",
                  style: AppTextStyles.sanF400.copyWith(fontSize: 14.sp),
                ),
                MySizedBox.h30,
                CaspaButton(
                  onTap: () {
                    Go.pop(context);
                  },
                  child: Text(
                    "Arzumun həyata keçməsini istəyirəm",
                    style:
                        AppTextStyles.sanF500.copyWith(color: MyColors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
