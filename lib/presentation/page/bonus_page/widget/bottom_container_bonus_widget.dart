import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../infrastructure/cubits/bonus_cubit/bonus_cubit.dart';
import '../../../../infrastructure/cubits/bonus_cubit/bonus_state.dart';
import '../../../../infrastructure/models/remote/response/bonus_model.dart';
import '../../../../util/constants/colors.dart';
import '../../../../widget/general/caspa_loading.dart';
import '../../../../widget/general/empty_widget.dart';
import '../../../../widget/general/sad_smile.dart';
import 'bonus_list.dart';

class BottomConyainerBonus extends StatelessWidget {
  const BottomConyainerBonus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        color: MyColors.white,
      ),
      child: BlocBuilder<BonusCubit, BonusState>(
        builder: (context, state) {
          if (state is BonusSuccess) {
            List<Data> bonus = state.bonusList;
            if (bonus.length < 1) {
              return SadSmile(
                  // text: "Balansınızda bonus yoxdur😞",
                  );
            }
            return BonusListWidget(bonus: bonus);
          } else if (state is BonusInProgress) {
            return CaspaLoading();
          }
          return Center(child: EmptyWidget());
        },
      ),
    );
  }
}
