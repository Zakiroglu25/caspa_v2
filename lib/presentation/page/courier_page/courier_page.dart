import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/presentation/page/courier_page/widgets/courier_list_view.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.courierOrder,
        user: false,
        notification: false,
        centerTitle: true,
        contextA: context,
      ),
      body: BlocBuilder<CourierCubit, CourierState>(
        buildWhen: (context, state) {
          if (state is CourierContinueButtonActive ||
              state is CourierInProgressButton ||
              state is CourierContinueButtonPassive ||
              state is CourierOperationFail) {
            return false;
          } else
            return true;
        },
        builder: (context, state) {
          if (state is CourierableFetched) {
            final packageList = state.packageList;
            return CourierListView(packageList: packageList);
          } else if (state is CourierInProgress) {
            return CaspaLoading();
          } else
            return EmptyWidget(
              text: MyText.youMustHaveProduct,
            );
        },
      ),
    );
  }
}
