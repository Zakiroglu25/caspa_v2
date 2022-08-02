import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaxNumberFieldRegister extends StatelessWidget {
  final TextEditingController? controller;

  TaxNumberFieldRegister({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).taxNumber,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.tax_number,
          maxLines: 1,
          hint: MyText.tax_number,
          upperCase: true,
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateTaxNumber(value),
        );
      },
    );
  }
}
