import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../general/app_radio.dart';

class CaspaPaymentRadio extends StatelessWidget {
  const CaspaPaymentRadio(this.mainContext,
      {Key? key,
      required this.value,
      required this.snapShoot,
      this.description})
      : super(key: key);
  final BuildContext mainContext;
  final AsyncSnapshot<Object?> snapShoot;
  final String value;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return AppRadio(
        onTap: () =>
            mainContext.read<PackageDetailsCubit>().updatePayType(value),
        title: "${value} ${description ?? ""}",
        isActive: snapShoot.data == value);
  }
}
