import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_state.dart';
import 'package:caspa_v2/presentation/page/delivery_address_page/widgets/modal_with_scroll.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../util/constants/paddings.dart';
import '../../../util/delegate/my_printer.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/screen/snack.dart';
import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/cupertino_modal_body.dart';
import '../../../widget/general/empty_widget.dart';
import 'widgets/current_adress_button.dart';
import 'widgets/selectable_addres_list.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoModalBody(
        body: Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        onBack: () => Go.pop(context),
        title: "Çatdırılma ünvanlarım",
        contextA: context,
      ),
      body: BlocConsumer<DeliveryAddressCubit, DeliveryAdressState>(
        listener: (context, state) {
          if (state is DeliveryAdressDeleted) {
            Snack.display(context: context, message: MyText.operationIsSuccess);
          }
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
        // buildWhen: (context, state) {
        //   if (state is DeliveryAdressError) {
        //     return false;
        //   } else
        //     return true;
        // },
        builder: (context, state) {
          bbbb("sttttt: $state");
          if (state is DeliveryAdressSuccess) {
            final deliveryAddress = state.deliveryAddress;
            final regionList = state.regionList;
            return FadeEdge(
              fadeHeight: 15,
              bottomButton: CurrentAdressButton(),
              child: Padding(
                padding: Paddings.paddingH16,
                child: SelectableAddAddressList(
                  deliveryAddress: deliveryAddress,
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
    ));
  }
}

class Address {
  String? address;
  String? subtitle;
  bool? checked;

  Address(this.address, this.subtitle, this.checked);
}
