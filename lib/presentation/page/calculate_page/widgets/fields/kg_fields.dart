import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KgField extends StatelessWidget {
  final TextEditingController? controller;

  const KgField({Key? key, this.controller})
      : super(key: key); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: BlocProvider.of<RegisterCubit>(context).adressStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.enter_kg,
          maxLines: 1,
          hint: MyText.enter_kg,
          upperCase: true,
          textInputType: TextInputType.number,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          // onChanged: (value) =>
          //     BlocProvider.of<RegisterCubit>(context).updateAdress(value),
        );
      },
    );
  }
}