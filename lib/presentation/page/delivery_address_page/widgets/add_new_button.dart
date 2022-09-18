import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../widget/custom/buttons/accent_button.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key, required this.regions}) : super(key: key);
  final List<Region> regions;

  @override
  Widget build(BuildContext context) {
    return AccentButton(
      title: MyText.addNewAdressX,
      onTap: () => context
          .read<DeliveryAddressCubit>()
          .goToAddPage(context: context, regions: regions),
    );
  }

}
