import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/presentation/page/courier_page/widgets/courier_list_view.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../infrastructure/models/remote/response/packages_data.dart';

class CourierPage extends StatelessWidget {
  CourierOrder? courierOrder;
  Package? package;

  CourierPage({this.courierOrder, this.package});

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        context.read<CourierCubit>().fetchPackagesForCourier(loading: false);
      },
      child: Scaffold(
        appBar: CaspaAppbar(
          title: MyText.courierOrder,
          user: false,
          notification: false,
          centerTitle: true,
          contextA: context,
        ),
        body: BlocBuilder<CourierCubit, CourierState>(
          buildWhen: (context, state) {
            if (state is CourierInProgressButton ||
                state is CourierConfigured ||
                state is CourierAdded ||
                state is CourierOperationFail) {
              return false;
            } else
              return true;
          },
          builder: (context, state) {
            if (state is CourierableFetched) {
              final packageList = state.packageList;
              final regionsList = state.regionList;
              return CourierPageListView(
                packageList: packageList,
                regionList: regionsList,
                courierOrder: courierOrder,
              );
            } else if (state is CourierInProgress) {
              return CaspaLoading();
            } else
              return EmptyWidget(
                text: MyText.youMustHaveProduct,
              );
          },
        ),
      ),
    );
  }
}
