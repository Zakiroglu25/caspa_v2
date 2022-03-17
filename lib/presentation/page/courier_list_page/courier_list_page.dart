import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/courier_list_page/widget/courier_list_view.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import '../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../infrastructure/cubits/package_details/package_details_state.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/delegate/pager.dart';
import '../../../util/screen/full_screen_loading.dart';
import '../../../util/screen/snack.dart';
import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/empty_widget.dart';
import '../webview_page/webview_page.dart';
import 'widget/courier_order_button.dart';

class CourierListPage extends StatelessWidget {
  CourierOrder? courierOrder;
  Package? package;

  CourierListPage({this.courierOrder, this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        contextA: context,
        title: MyText.courier,
      ),
      floatingActionButton: CourierOrderButton(),
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
            Go.to(context, Pager.success());
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
          } else {
            return FocusDetector(
              onFocusGained: () {
                context.read<CourierListCubit>()..fetch(false);
              },
              child: BlocConsumer<CourierListCubit, CourierListState>(
                listener: (c, state) {
                  if (state is CourierListInEditing) {
                    FullScreenLoading.display(context);
                  }
                },
                buildWhen: (c, state) {
                  if (state is CourierListDeleted ||
                      state is CourierListInEditing) {
                    return false;
                  } else {
                    return true;
                  }
                  ;
                },
                builder: (context, state) {
                  if (state is CourierListSuccess) {
                    final courierList = state.courierList.reversed.toList();
                    final packageList = state.packageList;
                    return CourierListView(courierList, packageList);
                  } else if (state is CourierListInProgress) {
                    return CaspaLoading();
                  } else if (state is CourierListError) {
                    return EmptyWidget(
                      text: state.error,
                    );
                  } else {
                    return EmptyWidget();
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
