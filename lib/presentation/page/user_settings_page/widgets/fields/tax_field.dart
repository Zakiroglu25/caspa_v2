import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/services/preferences_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../locator.dart';

class TaxFieldUser extends StatelessWidget {
  final TextEditingController ?controller;
  PreferencesService get _prefs => locator<PreferencesService>();
  TaxFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(

      value:_prefs.user.taxNumber!=null && _prefs.user.taxNumber!.isNotEmpty  ,
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
