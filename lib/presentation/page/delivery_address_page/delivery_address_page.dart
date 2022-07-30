import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import '../../../infrastructure/cubits/delivery_address_current/delivery_address_current_cubit.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../widget/general/caspa_loading.dart';
import '../../../widget/general/cupertino_modal_body.dart';
import '../../../widget/general/empty_widget.dart';
import 'widgets/current_adress_button.dart';
import 'widgets/delivery_addres_list.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final inOperations = context.read<DeliveryAddressCubit>().inOperations;
        if (inOperations) {
          Go.replace(context, Pager.deliveryAddress());
          return false;
        }
        return true;
      },
      child: CupertinoModalBody(
          body: Scaffold(
        appBar: CaspaAppbar(
          user: false,
          notification: false,
          onBack: () => Go.pop(context),
          title: MyText.myDeliveryAddresses,
          contextA: context,
        ),
        body: FocusDetector(
          onForegroundGained: () {
            context.read<DeliveryAddressCubit>().get();
          },
          child: BlocConsumer<DeliveryAddressCubit, DeliveryAddressState>(
            listener: (context, state) {
              if (state is DeliveryAdressSuccess) {}
            },
            // buildWhen: (context, state) {
            //   if (state is DeliveryAdressError) {
            //     return false;
            //   } else
            //     return true;
            // },
            builder: (context, state) {
              if (state is DeliveryAdressSuccess) {
                final deliveryAddress = state.deliveryAddress;
                final regionList = state.regionList;
                return FadeEdge(
                  fadeHeight: 15,
                  bottomButton: BlocProvider(
                    create: (context) => DeliveryAddressCurrentCubit()..get(),
                    child: CurrentAddressButton(),
                  ),
                  child: DeliveryAddressList(
                    regions: regionList,
                    deliveryAddress: deliveryAddress,
                    // packageList: state.packages,
                  ),
                );
              } else if (state is DeliveryAdressInProgress) {
                return CaspaLoading();
              } else {
                return EmptyWidget();
              }
            },
          ),
        ),
      )),
    );
  }
}
