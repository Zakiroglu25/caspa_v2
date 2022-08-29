import 'package:caspa_v2/infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/select_packages_pay/select_packages_pay_state.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../infrastructure/cubits/package_details/package_details_state.dart';
import '../../../util/constants/alerts.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/sized_box.dart';
import '../../../util/constants/text.dart';
import '../../../util/screen/full_screen_loading.dart';
import '../../../util/screen/snack.dart';
import '../webview_page/webview_page.dart';
import 'widgets/selectable_packages_list.dart';

class SelectPackagesPayPage extends StatelessWidget {
  const SelectPackagesPayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        title: '',
        contextA: context,
      ),
      body: BlocConsumer<PackageDetailsCubit, PackageDetailsState>(
        listener: (context, state) {
          bbbb("pay state:  $state");
          if (state is PackageDetailsPayError) {
            Snack.display(context: context, message: state.error);
          }
          if (state is PackageDetailsInProgress) {
            FullScreenLoading.display(context);
          } else {
            FullScreenLoading.hide(context);
          }
          if (state is PackageDetailsPaid) {
            //Go.pop(context);
            context.read<SelectPackagesPayCubit>()..fetchActiveUnpaid();
            Snack.positive(
                context: context, message: MyText.operationIsSuccess);
          }
        },
        builder: (context, state) {
          if (state is PackageDetailsUrlFetched) {
            return WebviewPage(
              url: state.url,
              mainContext: context,
              whenSuccess: () =>
                  context.read<PackageDetailsCubit>().paymentSuccess(context),
            );
          }
          return FocusDetector(
            onFocusGained: () =>
                context.read<SelectPackagesPayCubit>()..fetchActiveUnpaid(),
            child: ListView(
              padding: Paddings.paddingA16,
              children: [
                Text(
                  MyText.payTotal,
                  style: AppTextStyles.coHead500.copyWith(fontSize: 25),
                ),
                MySizedBox.h20,
                Text(
                  MyText.touchPayButtonText,
                  style: AppTextStyles.sanF400
                      .copyWith(fontSize: 14.sm, color: MyColors.grey165),
                ),
                MySizedBox.h20,
                BlocConsumer<SelectPackagesPayCubit, SelectPackagesPayState>(
                  listener: (context, state) {
                    if (state is SelectPackagesPayShowPaymentDialog) {
                      Alerts.selectedPackagessPaymentAlert(
                          context: context,
                          selectedOrders: state.selectedOrders);
                    }
                  },
                  buildWhen: (context, state) {
                    if (state is SelectPackagesPayShowPaymentDialog) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                  builder: (context, state) {
                    if (state is SelectPackagesPaySuccess) {
                      return SelectablePackagesList(
                        packageList: state.packages,
                      );
                    }
                    if (state is SelectPackagesPayInProgress) {
                      return CaspaLoading();
                    } else {
                      return EmptyWidget();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
