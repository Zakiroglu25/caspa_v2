import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_state.dart';
import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
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
import '../../../util/screen/full_screen_loading.dart';
import '../webview_page/webview_page.dart';
import 'widget/add_order_button.dart';
import 'widget/attorney_get_list_widget.dart';

class OrderViaLinkListPage extends StatelessWidget {
  const OrderViaLinkListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        contextA: context,
        title: MyText.orders,
        notification: false,
      ),
      body: BlocConsumer<PackageDetailsCubit, PackageDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
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
            context.read<OrderViaUrlListCubit>().fetch(false);
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
            onFocusGained: () {
              context.read<OrderViaUrlListCubit>().fetch(false);
            },
            child: ListView(
              padding: Paddings.paddingA16,
              children: [
                ColorfullBackImage(
                  path: Assets.pngSebet,
                  infoTitle: MyText.littleOrderViaLink,
                  infoContent: MyText.infoOrderViaLink,
                  titleMaxLines: 2,
                ),
                MySizedBox.h16,
                AddAttorneyButton(),
                MySizedBox.h32,
                BlocConsumer<OrderViaUrlListCubit, OrderViaUrlListState>(
                    listener: (context, state) {
                  if (state is OrderViaUrlListDeleted) {
                    Snack.display(
                        context: context,
                        message: MyText.operationIsSuccess,
                        positive: true,
                        showSuccessIcon: true);
                  }
                }, buildWhen: (context, state) {
                  if (state is OrderViaUrlListDeleted) {
                    return false;
                  } else
                    return true;
                }, builder: (context, state) {
                  if (state is OrderViaUrlListSuccess) {
                    List<LinkOrder> orderList = state.orders.reversed.toList();
                    return OrderListWidget(
                      orderList: orderList.reversed.toList(),
                    );
                  } else if (state is OrderViaUrlListInProgress) {
                    return CaspaLoading();
                  } else {
                    return EmptyWidget();
                  }
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
