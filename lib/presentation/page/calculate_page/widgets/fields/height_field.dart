import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';

class HeightField extends StatelessWidget {
  final TextEditingController? controller;

  const HeightField({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // stream: BlocProvider.of<RegisterCubit>(context).adressStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.height_under,
          maxLines: 1,
          hint: MyText.height_hint,
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
