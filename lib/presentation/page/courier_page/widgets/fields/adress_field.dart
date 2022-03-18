import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdressFieldCourier extends StatelessWidget {
  final TextEditingController? controller;

  AdressFieldCourier({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '' && controller!.text != 'null')
      BlocProvider.of<CourierCubit>(context).updateAdress(controller!.text);

    return StreamBuilder<String>(
      stream: BlocProvider.of<CourierCubit>(context).adressStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.adress,
          maxLines: 1,
          hint: MyText.adress,
          upperCase: true,
          textInputType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<CourierCubit>(context).updateAdress(value),
        );
      },
    );
  }
}
