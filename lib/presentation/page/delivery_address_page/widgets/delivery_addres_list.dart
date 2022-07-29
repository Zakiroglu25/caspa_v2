import 'package:caspa_v2/presentation/page/delivery_address_page/widgets/add_new_button.dart';
import 'package:caspa_v2/presentation/page/delivery_address_page/widgets/delivery_address_element.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import '../../../../infrastructure/models/remote/response/delivery_address_model.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';

class DeliveryAddressList extends StatelessWidget {
  final List<DeliveryAddress>? deliveryAddress;
  final List<Region> regions;
  DeliveryAddressList({
    required this.deliveryAddress,
    required this.regions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Paddings.paddingH16,
      children: [
        ListOrEmpty(
          elseChild: Image.asset(Assets.pngMoto),
          description: MyText.emptyDeliveryAddressDesc,
          list: deliveryAddress,
          child: ListView.builder(
            shrinkWrap: true,
            physics: Physics.never,
            itemCount: deliveryAddress?.length,
            padding: Paddings.paddingB16 + Paddings.paddingT8,
            itemBuilder: (context, index) {
              final current = deliveryAddress?.reversed.toList()[index];
              return StreamBuilder<int?>(
                  stream: BlocProvider.of<DeliveryAddressCubit>(context)
                      .selectedAdressIdStream,
                  builder: (context, snapshot) {
                    return DeliveryAddressElement(
                      regions: regions,
                      id: index,
                      selected: snapshot.data == current,
                      onTap: () => context
                          .read<DeliveryAddressCubit>()
                          .updateSelectedAdressId(current?.id),
                      deliveryAddress: current!,
                    );
                  });
              return SizedBox();
            },
          ),
        ),
        AddNewAdressButton(
          regions: regions,
        ),
        MySizedBox.h100
      ],
    );
  }
}
