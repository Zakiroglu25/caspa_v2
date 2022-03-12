import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../general/caspa_radio.dart';

class CaspaPaymentRadio extends StatelessWidget {
  const CaspaPaymentRadio(this.mainContext,
      {Key? key, required this.value, required this.snapShoot})
      : super(key: key);
  final BuildContext mainContext;
  final AsyncSnapshot<Object?> snapShoot;
  final String value;
  @override
  Widget build(BuildContext context) {
    return CaspaRadio(
        onTap: () =>
            mainContext.read<PackageDetailsCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
