import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'widget/add_attorney_button.dart';
import 'widget/attorney_get_list_widget.dart';

class EtibarnamePage extends StatelessWidget {
  const EtibarnamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: MyText.attorneysX,
        notification: false,
      ),
      body: FocusDetector(
        onFocusGained: () {
          context.read<AttorneyListCubit>().fetch(false);
        },
        child: ListView(
          padding: Paddings.paddingA16,
          children: [
            ColorfullBackImage(
              path: Assets.pngEtibarname,
              infoTitle: MyText.littleEtibar,
              infoContent: MyText.weAdviceSaveMoneyOnBalance,
            ),
            MySizedBox.h16,
            AddAttorneyButton(),
            MySizedBox.h32,
            BlocConsumer<AttorneyListCubit, AttorneyListState>(
                listener: (context, state) {
              if (state is AttorneyDeleted) {
                Snack.display(
                    context: context,
                    message: MyText.operationIsSuccess,
                    positive: true,
                    showSuccessIcon: true);
              }
            }, buildWhen: (context, state) {
              if (state is AttorneyDeleted) {
                return false;
              } else
                return true;
            }, builder: (context, state) {
              if (state is AttorneyListSuccess) {
                List<Attorney> attorneyList = state.attorney.reversed.toList();
                return AttorneyListWidget(
                  attorneyList: attorneyList,
                );
              } else if (state is AttorneyListInProgress) {
                return CaspaLoading();
              } else {
                return EmptyWidget();
              }
            }),
          ],
        ),
      ),
    );
  }
}
