import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_state.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'promo_code_list_element.dart';
import 'promo_table_title.dart';

class PromoCodesList extends StatelessWidget {
  PromoCodesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoCodeCubit, PromoCodeState>(
      buildWhen: (context, state) {
        if (state is PromoCodeInAdding ||
            state is PromoCodeAdded ||
            state is PromoCodeNotAdded) {
          return false;
        } else
          return true;
      },
      builder: (context, state) {
        if (state is PromoCodeSuccess) {
          final promoCodeList = state.promoList;
          return ListOrEmpty(
            list: promoCodeList,
            child: Column(
              children: [
                PromoTableTitle(),
                MySizedBox.h20,
                ListView.builder(
                  shrinkWrap: true,
                  physics: Physics.never,
                  itemCount: promoCodeList.length,
                  itemBuilder: (context, index) {
                    return PromoCodeListElement(
                        promoCode: promoCodeList[index]);
                  },
                ),
              ],
            ),
          );
        }
        if (state is PromoCodeInProgress) {
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
