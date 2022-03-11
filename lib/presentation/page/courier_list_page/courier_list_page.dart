import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_list_cubit/courier_list_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/presentation/page/courier_list_page/widget/courier_list_view.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/empty_widget.dart';

class CourierListPage extends StatelessWidget {
   const CourierListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CaspaAppbar(
          user: false,
          contextA: null,
          title: 'Kuryer',
        ),
        body: BlocBuilder<CourierListCubit, CourierListState>(
          builder: (context, state) {
            if (state is CourierListSuccess) {
              final courierList = state.courierList;
              // final productList = state.productList;
              return CourierListView(courierList);
            } else if (state is CourierListInProgress) {
              return CaspaLoading();
            } else if (state is CourierListError) {
              return EmptyWidget(
                text: state.error,
              );
            } else
              return EmptyWidget();
          },
        ),
    );
  }
}
