import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';

class SurNameFieldUser extends StatelessWidget {
  final TextEditingController? controller;

  SurNameFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CaspaField(
      title: MyText.surname,
      maxLines: 1,
      hint: MyText.surname,
      upperCase: true,
      textInputType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      //errorMessage: snapshot.error == null ? null : '${snapshot.error}',
      //  controller: controller,
      // onChanged: (value) => BlocProvider.of<UserCubit>(context).updateSurName(value),
    );
  }
}
