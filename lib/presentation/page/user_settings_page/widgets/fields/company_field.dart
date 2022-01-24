import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../locator.dart';

class CompanyFieldUser extends StatelessWidget {
  final TextEditingController? controller;
  HiveService get _prefs => locator<HiveService>();
  CompanyFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: _prefs.user.companyName != null &&
          _prefs.user.companyName!.isNotEmpty,
      child: StreamBuilder<String>(
        stream: BlocProvider.of<UserCubit>(context).companyNameStream,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.company_name,
            maxLines: 1,
            hint: MyText.company_name,
            upperCase: true,
            textInputType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            onChanged: (value) =>
                BlocProvider.of<UserCubit>(context).updateCompanyName(value),
          );
        },
      ),
    );
  }
}
