import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/plus994.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/formatter/phone_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  PhoneFieldRegister({this.controller});

  //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).phoneStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: "phone",
          maxLines: 1,
          hint: 'phone',
          upperCase: true,
          textInputType: TextInputType.phone,
          formatters: [PhoneNumberFormatter()],
          maxLenght: 14,
          prefixIcon: Plus994(),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updatePhone(value),
        );
      },
    );
  }
}