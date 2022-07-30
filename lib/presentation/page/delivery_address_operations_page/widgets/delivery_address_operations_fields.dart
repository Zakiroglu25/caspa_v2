import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_address_operations_state.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import '../../../../infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import 'delivery_address_operations_add_button.dart';
import 'fields/details_field_deliver_operations.dart';
import 'fields/name_field_deliver_operations.dart';
import 'fields/number_field.dart';
import 'fields/region_field_delivery_operations.dart';

class DeliveryAddressOperationsFields extends StatelessWidget {
  const DeliveryAddressOperationsFields(
      {Key? key,
      required this.id,
      required this.regions,
      required this.controller})
      : super(key: key);
  final List<Region> regions;
  final TextEditingController controller;
  final int? id;
  @override
  Widget build(BuildContext context) {
    bbbb("buildedddddd");
    return ListView(
      padding: Paddings.paddingA16 + Paddings.paddingT8,
      shrinkWrap: true,
      children: [
        SectionName(title: MyText.delivery_adress),
        MySizedBox.h16,
        NameFieldDeliverOperations(
            controller:
                context.read<DeliveryAdressOperationsCubit>().nameController),
        RegionFieldDeliveryOperations(
          regionList: regions,
        ),
        PhoneFieldDeliveryOperations(
            controller:
                context.read<DeliveryAdressOperationsCubit>().phoneController),
        DetailsFieldDeliverOperations(
            controller: context
                .read<DeliveryAdressOperationsCubit>()
                .detailsController),
        MySizedBox.h36,
        DeliveryAddressOperationsAddButton(
          id: id,
        )
      ],
    );
  }
}
