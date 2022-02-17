import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:flutter/material.dart';

import '../../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../../infrastructure/models/remote/response/packages_data.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/screen/alert.dart';
import '../../../../widget/custom/buttons/fade_raised_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/general/caspa_radio.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {Key? key,
      required this.packages,
      required this.phone,
      required this.region,
      required this.price,
      required this.adress})
      : super(key: key);
  final List<Package> packages;
  final String phone;
  final String adress;
  final String price;
  final Region region;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: FadeRaisedButton(
          title: MyText.confirming,
          loading:
              (context.watch<CourierCubit>().state is CourierInProgressButton),
          onTap: () => context.read<CourierCubit>().addCourier(
                context,
                region: region,
                phone: phone,
                adress: adress,
                packages: packages,
              ),
        ));
  }
}
