import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import '../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_state.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/delegate/pager.dart';
import 'widgets/delivery_address_operations_fields.dart';
import 'widgets/fields/delivery_address_operations_title.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_address_operations_state.dart';
import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/delegate/navigate_utils.dart';

class DeliveryAddressOperationsPage extends StatelessWidget {
  DeliveryAddressOperationsPage({
    Key? key,
    required this.regions,
  }) : super(key: key);
  final List<Region> regions;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
          child: SafeArea(
        top: false,
        child: BlocConsumer<DeliveryAdressOperationsCubit,
            DeliveryAdressOperationsState>(
          listener: (context, state) {
            if (state is DeliveryAdressOperationsSuccess) {
              context.read<DeliveryAddressCubit>().get();
            }
          },
          builder: (context, state) {
            if (state is DeliveryAdressOperationsSuccess) {
              final id = state.id;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DeliveryAddressOperationsTitle(),
                    DeliveryAddressOperationsFields(
                        regions: regions, id: id, controller: controller),
                  ],
                ),
              );
            } else if (state is DeliveryAdressOperationsInProgress) {
              return CaspaLoading();
            } else {
              return EmptyWidget();
            }
          },
        ),
      )),
    );
  }
}
