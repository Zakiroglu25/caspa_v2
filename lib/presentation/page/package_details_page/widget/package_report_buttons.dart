import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_radio.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'info_mini_button.dart';
import 'package_main_button.dart';
import 'pay_button.dart';

class PackageReportButtons extends StatelessWidget {
  const PackageReportButtons({Key? key, required this.package})
      : super(key: key);
  final Package package;

  @override
  Widget build(BuildContext context) {
    eeee("noInvoice: ${package.noInvoice}");
    eeee("regNumber: ${package.regNumber}");
    // package.payment_balance = 1;
    final sW = MediaQuery.of(context).size.width;

    return WidgetOrEmpty(
        value: getStatus(context: context, package: package, sW: sW) != null,
        child: Column(
          children: [
            MySizedBox.h48,
            Container(
              height: 44,
              padding: Paddings.paddingH16,
              child: getStatus(context: context, package: package, sW: sW),
            ),
          ],
        ));
  }

  Widget? getStatus({
    required BuildContext context,
    required Package package,
    required double sW,
  }) {
    bbbb("package: $package");
    // package.payment = 0;
    String customStatus = package.customStatus!;
    if (customStatus == MyText.stOrdered &&
        package.from_report == MyText.upex) {
      //beyan et
      //silmek olmaz
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PackageMainButton(
              w: (sW - 32),
              text: MyText.declareIt,
              onTap: () => Go.to(context, Pager.report(package: package))),
        ],
      );
    } else if (customStatus == MyText.stOrdered && package.noInvoice == 0) {
      //duzelish et
      //sil

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Spacer(),
          PackageMainButton(
              text: MyText.editIt,
              w: (sW - 32) - 55,
              onTap: () => Go.to(context, Pager.report(package: package))),
          InfoMiniButton(
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
        ],
      );
    } else if (customStatus == MyText.stWarehouse) {
      //gomruye beyan et
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PackageMainButton(
              w: (sW - 32),
              text: MyText.declareItCustom,
              onTap: () => Go.to(context, Pager.report(package: package))),
        ],
      );
    } else if (package.payment == 0) {
      //odenish et
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PayButton(
            package: package,
          ),
        ],
      );
    } else if (package.payment == 1 && customStatus == MyText.stArrived
        // (customStatus != MyText.stGave ||
        //     customStatus != MyText.stGaveByCourier)
        ) {
      //kuryer sifaris et
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PackageMainButton(
              w: (sW - 32),
              text: MyText.courierOrder,
              onTap: () => Go.to(context, Pager.courier)),
        ],
      );
    } else {
      //bosh
      bbbb("dfdffgd");
    }
  }
}