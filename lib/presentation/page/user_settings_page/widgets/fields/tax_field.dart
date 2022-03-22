import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../locator.dart';

class TaxFieldUser extends StatelessWidget {
  final  controller;

  HiveService get _prefs => locator<HiveService>();

  TaxFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // if(controller!.text != '' && controller!.text != null){
    //   BlocProvider.of<UserCubit>(context).updateTaxNumber(controller!.text);
    // }
    return WidgetOrEmpty(
      value: _prefs.user.taxNumber != null && _prefs.user.taxNumber!.isNotEmpty,
      child: StreamBuilder<String>(
        stream: BlocProvider.of<UserCubit>(context).tax_numberStream,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.tax_number,
            maxLines: 1,
            hint: MyText.tax_number,
            upperCase: true,
            textInputType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            onChanged: (value) =>
                BlocProvider.of<UserCubit>(context).updateTaxNumber(value),
          );
        },
      ),
    );
  }
}
