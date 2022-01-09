import 'package:caspa_v2/infrastructure/cubits/gift_cubit/gift_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/gift_cubit/gift_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/gift_model.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/widget/gift_listview.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftBalance extends StatelessWidget {
  GiftModel? giftModel;

  GiftBalance({Key? key, this.giftModel}) : super(key: key);

  // List<CodeModel> hList = [
  //   CodeModel(code: "caspa azerbaycan214987563", date: "07.10.2021 13:50", confrim: "Xeyr",balance: "4.00"),
  //   CodeModel(code: "caspa azerbaycan214987563", date: "07.10.2021", confrim: "Xeyr",balance: "4.00"),
  //   CodeModel(code: "COSMOS3", date: "07.10.2021 13:50", confrim: "Beli",balance: "4.00"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: "Hədiyyə balansı 💸",
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            ColorfullBackImage(
              path: Assets.pngPosTerminal,
              infoTitle: MyText.littleGift,
              infoContent: MyText.InfoGift,
            ),
            MySizedBox.h16,
            CaspaField(
              title: "Promokod",
              hint: "Promokod",
            ),
            MySizedBox.h16,
            CaspaButton(text: "Tətbiq et"),
            MySizedBox.h32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kod",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
               // MySizedBox.w90,
                // Text(
                //   "Tarix",
                //   style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                // ),
                MySizedBox.w70,
                Text(
                  "Edilib",
                  style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                ),
                // Spacer(),
                // Text(
                //   "Balans",
                //   style: AppTextStyles.sanF600.copyWith(fontSize: 16.sp),
                // ),
              ],
            ),
            BlocBuilder<GiftCubit, GiftState>(
              builder: (context, state) {
                if (state is GiftSuccess) {
                   List<Data>? giftList = state.giftList;
                  return GiftList(giftList: giftList);
                } else if (state is GiftInProgress) {
                  return CaspaLoading();
                } else if (state is GiftError) {
                  return EmptyWidget(
                    text: state.error,
                  );
                } else {
                  return EmptyWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class CodeModel {
  String? code;
  String? date;
  String? confrim;
  String? balance;

  CodeModel({this.code, this.date, this.confrim, this.balance});
}
