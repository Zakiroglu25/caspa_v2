import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/section_name_and_definition.dart';
import 'package:caspa_v2/widget/general/single_child_bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/fields/category_field.dart';
import 'widgets/fields/count_field.dart';
import 'widgets/fields/note_field.dart';
import 'widgets/fields/price_field.dart';
import 'widgets/fields/price_type_field.dart';
import 'widgets/fields/seller_field.dart';
import 'widgets/fields/tracking_id_field.dart';
import 'widgets/photo_pickment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/report_contiue_button.dart';

class ReportPage extends StatelessWidget {
  final Package? package;
  ReportPage({this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(title: MyText.report, user: false, contextA: context),
      body: SafeArea(
        child: BlocListener<ReportCubit, ReportState>(
          listener: (context, state) {
            if (state is ReportInProgress) {
              FullScreenLoading.display(context);
            } else if (state is ReportSuccess) {
              Go.replace(
                  context,
                  Pager.success(
                      infoTitle: MyText.reportSuccessTitle,
                      infoContent: MyText.reportSuccessContent,
                      againPage: Pager.report()));
            } else if (state is ReportError) {
              if (state.error != null) {
                Snack.display(context: context, message: state.error);
              }
            }
          },
          child: SingleChildBounce(
            padding: Paddings.paddingH16,
            child: Column(
              children: [
                SectionNameAndDefinition(
                  imagePath: Assets.otherBox,
                  name: MyText.addProduct,
                  definition: MyText.declareText,
                ),
                MySizedBox.h24,
                SellerFieldReport(
                  controller: TextEditingController(text: package?.store),
                ),
                CategoryFields(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PriceFieldReport(
                      controller: TextEditingController(text: package?.price),
                    ),
                    PriceTypeFieldReport()
                  ],
                ),
                CountFieldReport(),
                TrackingIdFieldReport(
                    controller: TextEditingController(text: package?.tracking)),
                NoteFieldReport(
                    controller: TextEditingController(text: package?.note)),
                SectionName(title: MyText.factura),
                MySizedBox.h16,
                PhotoPickment(
                  url: package?.invoice,
                ),
                MySizedBox.h12,
                Text(
                  MyText.facturaText,
                  style:
                      AppTextStyles.sanF400.copyWith(color: MyColors.grey153),
                ),
                MySizedBox.h24,
                ReportContiueButton(package: package),
                MySizedBox.h40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
