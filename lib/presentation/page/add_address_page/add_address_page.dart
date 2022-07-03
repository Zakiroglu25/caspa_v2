import 'package:caspa_v2/presentation/page/add_address_page/widget/selectable_add_address.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../infrastructure/cubits/package_details/package_details_state.dart';
import '../../../infrastructure/cubits/select_packages_pay/select_packages_pay_cubit.dart';
import '../../../infrastructure/cubits/select_packages_pay/select_packages_pay_state.dart';
import '../../../util/constants/alerts.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/paddings.dart';
import '../../../util/constants/sized_box.dart';
import '../../../util/constants/text.dart';
import '../../../util/screen/full_screen_loading.dart';
import '../../../util/screen/snack.dart';
import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/empty_widget.dart';
import '../select_packages_pay_page/widgets/selectable_packages_list.dart';
import '../webview_page/webview_page.dart';
import 'widget/selectable_addres_list.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        title: "Çatdırılma ünvanlarım",
        contextA: context,
      ),
      body: BlocConsumer<PackageDetailsCubit, PackageDetailsState>(
        listener: (context, state) {
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
        buildWhen: (context, state) {
          if (state is SelectPackagesPayShowPaymentDialog) {
            return false;
          } else
            return true;
        },
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                children: [
                  BlocConsumer<SelectPackagesPayCubit, SelectPackagesPayState>(
                    listener: (context, state) {
                      // if (state is SelectPackagesPayShowPaymentDialog) {
                      //   Alerts.selectedPackagessPaymentAlert(
                      //       context: context,
                      //       selectedOrders: state.selectedOrders);
                      // }
                    },
                    builder: (context, state) {
                      if (state is SelectPackagesPaySuccess) {
                        return SelectableAddAddressList(
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
              Positioned(
                right: 16,
                left: 16,
                bottom: 0,
                child: Container(
                  width: 343,
                  height: 72,
                  decoration: BoxDecoration(
                    color: MyColors.mainColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Column(
                        children: [
                          Text("Mövcüd ünvan"),
                          Text("Qara Qarayev 8"),

                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class Address {
  String? address;
  String? subtitle;
  bool? checked;

  Address(this.address, this.subtitle, this.checked);
}
