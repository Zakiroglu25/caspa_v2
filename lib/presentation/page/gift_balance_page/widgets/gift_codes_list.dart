import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_state.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'gift_table_title.dart';
import 'gift_code_list_element.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GiftCodesList extends StatelessWidget {
  GiftCodesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiftBalanceCubit, GiftBalanceState>(
      buildWhen: (context, state) {
        if (state is GiftBalanceInAdding ||
            state is GiftBalanceAdded ||
            state is GiftBalanceNotAdded) {
          return false;
        } else
          return true;
      },
      builder: (context, state) {
        if (state is GiftBalanceSuccess) {
          final giftCodeList = state.promoList;
          return ListOrEmpty(
            list: giftCodeList,
            child: Column(
              children: [
                GiftTableTitle(),
                MySizedBox.h20,
                ListView.builder(
                  shrinkWrap: true,
                  physics: Physics.never,
                  itemCount: giftCodeList.length,
                  itemBuilder: (context, index) {
                    return GiftCodeListElement(
                        giftBalance: giftCodeList[index]);
                  },
                ),
              ],
            ),
          );
        }
        if (state is GiftBalanceInProgress) {
          return CaspaLoading();
        } else {
          return EmptyWidget(
            text: MyText.error,
          );
        }
      },
    );
  }
}
