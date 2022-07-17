import 'package:caspa_v2/infrastructure/cubits/delivery_adress/delivery_adress_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_adress/delivery_adress_state.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../util/constants/paddings.dart';
import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/empty_widget.dart';
import 'widgets/current_adress_button.dart';
import 'widgets/selectable_addres_list.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        title: "Çatdırılma ünvanlarım",
        contextA: context,
      ),
      body: BlocConsumer<DeliveryAdressCubit, DeliveryAdressState>(
        listener: (context, state) {
          // if (state is PackageDetailsPayError) {
          //  // Snack.display(context: context, message: state.error);
          // }
          // if (state is PackageDetailsInProgress) {
          //   FullScreenLoading.display(context);
          // } else {
          //   FullScreenLoading.hide(context);
          // }
          // if (state is PackageDetailsPaid) {
          //   //Go.pop(context);
          //   context.read<SelectPackagesPayCubit>()..fetchActiveUnpaid();
          //   Snack.positive(
          //       context: context, message: MyText.operationIsSuccess);
          // }
        },
        buildWhen: (context, state) {
          if (state is DeliveryAdressError) {
            return false;
          } else
            return true;
        },
        builder: (context, state) {
          if (state is DeliveryAdressSuccess) {
            return FadeEdge(
              fadeHeight: 15,
              bottomButton: CurrentAdressButton(),
              child: Padding(
                padding: Paddings.paddingH16,
                child: SelectableAddAddressList(
                  packageList: [1, 2, 3],
                  // packageList: state.packages,
                ),
              ),
            );
          } else if (state is DeliveryAdressInProgress) {
            return CaspaLoading();
          } else {
            return EmptyWidget();
          }
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
