import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SaveAttorneyButton extends StatelessWidget {
 Attorney? attorney;

 SaveAttorneyButton({this.attorney});

  @override
  Widget build(BuildContext context) {
    return           CaspaButton(
      text: MyText.save,
      onTap: () {
       attorney!=null?  context.read<AddAttorneysCubit>().editAttorney(attorney!):context.read<AddAttorneysCubit>().addAttorney();
      },
    );
  }
}