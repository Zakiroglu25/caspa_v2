import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneFieldDeliveryOperations extends StatelessWidget {
  final TextEditingController? controller;

  PhoneFieldDeliveryOperations({this.controller});

  //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '' && controller!.text != 'null')
      BlocProvider.of<DeliveryAdressOperationsCubit>(context)
          .updatePhone(controller!.text);

    return StreamBuilder<String>(
      stream:
          BlocProvider.of<DeliveryAdressOperationsCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.phone_number,
          maxLines: 1,
          hint: MyText.phone_number,
          upperCase: true,
          textInputType: TextInputType.phone,
          // formatters: [PhoneNumberFormatter(with994: false)],
          maxLenght: 15,
          //prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<DeliveryAdressOperationsCubit>(context)
                  .updatePhone(value),
        );
      },
    );
  }
}
