import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionFieldCourier extends StatelessWidget {
  final TextEditingController? controller;

  RegionFieldCourier({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<CourierCubit>(context).regionStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.region,
          maxLines: 1,
          hint: MyText.region,
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<CourierCubit>(context).updateRegion(value),
        );
      },
    );
  }
}
