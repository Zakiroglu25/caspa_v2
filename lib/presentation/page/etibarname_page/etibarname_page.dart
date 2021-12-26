import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_etibarname_page.dart';
import 'widget/attorney_get_list_widget.dart';

class EtibarnamePage extends StatelessWidget {
  const EtibarnamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: "Etibarnamələr 📑",
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: ListView(
          children: [
            ColorfullBackImage(
              path: Assets.pngEtibarname,
              infoTitle: MyText.littleEtibar,
              infoContent: MyText.paymentLinkTxt,
            ),
            MySizedBox.h16,
            CaspaButton(
              text: "Yeni etibarnamə",
              onTap: () {
                Go.to(
                    context,
                    BlocProvider.value(
                      value: AddAttorneysCubit()..addAttorney(),
                      child: AddEtibarname(),
                    ));
              },
            ),
            MySizedBox.h32,
            BlocBuilder<AttorneyListCubit, AttorneyListState>(
                builder: (context, state) {
              if (state is AttorneyListSuccess) {
                List<Data> attorneyList = state.attorney;
                return AttorneyListWidget(
                  attorneyList: attorneyList,
                );
              } else if (state is AttorneyListInProgress) {
                return CaspaLoading(
                  s: 92.sp,
                );
              } else if (state is AttorneyListNetworkError) {
                return NoData();
              }
              return NoData();
            }),
          ],
        ),
      ),
    );
  }
}
