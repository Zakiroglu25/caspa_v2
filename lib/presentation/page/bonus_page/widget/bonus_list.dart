import 'package:caspa_v2/infrastructure/cubits/bonus_cubit/bonus_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infrastructure/models/remote/response/bonus_model.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';

class BonusListWidget extends StatelessWidget {
  const BonusListWidget({
    Key? key,
    required this.bonus,
  }) : super(key: key);

  final List<Data> bonus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingV16 + Paddings.paddingH16,
      child: RefreshIndicator(
        color: MyColors.mainColor,
        onRefresh: () async {
          context.read<BonusCubit>().fetch();
        },
        child: ListView.builder(
            itemCount: bonus.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: Paddings.paddingV8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    bonus[index].used == 0
                        ? SvgPicture.asset(Assets.svgBonusIn)
                        : SvgPicture.asset(Assets.svgBonusOut),
                    MySizedBox.w12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bonus[index].used == 0 ? "Mədaxil" : "Məxaric",
                          style: AppTextStyles.sanF600,
                        ),
                        Text(
                          "${bonus[index].type}",
                          style: AppTextStyles.sanF400
                              .copyWith(color: MyColors.grey153),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: MyColors.grey245,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svgClock),
                              MySizedBox.w12,
                              Text(
                                "${bonus[index].deleteDays}",
                                style: AppTextStyles.sanF500
                                    .copyWith(color: MyColors.black34),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      bonus[index].used == 0
                          ? "+" + "${bonus[index].amount}" + "\$"
                          : "-" + "${bonus[index].amount}" + "\$",
                      style: AppTextStyles.sanF600
                          .copyWith(color: MyColors.black34, fontSize: 16.sp),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
