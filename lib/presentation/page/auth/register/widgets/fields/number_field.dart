import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../util/formatter/masked_text_controller_phone.dart';

class PhoneFieldRegister extends StatefulWidget {
  final TextEditingController? controller;

  PhoneFieldRegister({this.controller});

  @override
  State<PhoneFieldRegister> createState() => _PhoneFieldRegisterState();
}

class _PhoneFieldRegisterState extends State<PhoneFieldRegister> {
  late TextEditingController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = MaskedTextController.app();
  }

  //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.phone_number,
          maxLines: 1,
          hint: MyText.phone_number,
          upperCase: true,
          textInputType: TextInputType.phone,
          //formatters: [PhoneNumberFormatter()],
          maxLenght: 15,
          // prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updatePhone(value),
        );
      },
    );
  }
}
