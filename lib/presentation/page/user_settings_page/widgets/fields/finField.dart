import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinFieldUser extends StatelessWidget {
  final TextEditingController ?controller;

  FinFieldUser({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).finStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.fin,
          maxLines: 1,
          hint: MyText.fin, 
          upperCase: true,
          suffixIcon: Tooltip(message: 'burda fin kod olacay'),
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.characters,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
           controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateFin(value),
        );
      },
    );
  }
}
