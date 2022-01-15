import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/plus994.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/phone_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneFieldCourier extends StatelessWidget {
  final TextEditingController? controller;

  PhoneFieldCourier({this.controller});

  //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<CourierCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.phone_number,
          maxLines: 1,
          hint: MyText.phone_number,
          upperCase: true,
          textInputType: TextInputType.phone,
          formatters: [PhoneNumberFormatter()],
          maxLenght: 14,
          prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<CourierCubit>(context).updatePhone(value),
        );
      },
    );
  }
}
