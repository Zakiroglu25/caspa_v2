import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'info_mini_button.dart';

class PackageReportButtons extends StatelessWidget {
  const PackageReportButtons({Key? key, required this.package})
      : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    eeee("noInvoice: ${package.noInvoice}");
    eeee("regNumber: ${package.regNumber}");

    return WidgetOrEmpty(
      value: package.regNumber == null,
      child: Column(
        children: [
          MySizedBox.h48,
          Container(
            height: 44,
            padding: Paddings.paddingH16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Spacer(),
                WidgetOrEmpty(
                  value: true,
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width - 32) - 55,
                    child: CaspaButton(
                      onTap: () =>
                          Go.to(context, Pager.report(package: package)),
                      text: package.noInvoice == 1
                          ? MyText.declareIt
                          : MyText.editIt,
                    ),
                  ),
                ),
                //Spacer(),
                WidgetOrEmpty(
                  value: package.noInvoice != 1,
                  child: InfoMiniButton(
                    onTap: () => Alert.show(context,
                        cancelButton: true,
                        image: SvgPicture.asset(
                          Assets.svgTrash,
                          height: 80,
                          width: 80,
                        ),
                        title: MyText.are_u_sure_delete, onTap: () {
                      context
                          .read<ReportCubit>()
                          .deleteReport(context, id: package.id!);
                    }),
                    svgPath: Assets.svgTrash,
                  ),
                ),
                //Spacer(),
                // InfoMiniButton(
                //   onTap: () {},
                //   svgPath: Assets.svgEdit,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
