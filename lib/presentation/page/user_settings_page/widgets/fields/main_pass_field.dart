import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/icons/invisible_icon.dart';
import 'package:caspa_v2/widget/icons/visible_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPassFieldUser extends StatefulWidget {
  final controller;

  MainPassFieldUser({this.controller});

  @override
  State<MainPassFieldUser> createState() => _MainPassFieldUserState();
}

class _MainPassFieldUserState extends State<MainPassFieldUser> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    // if(widgets.controller!.text != '' && widgets.controller!.text != null){
    //   BlocProvider.of<UserCubit>(context).updateFin(widgets.controller!.text);
    // }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).passMainStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.new_pass,
          maxLines: 1,
          hint: MyText.enter_new_pass,
          suffixIcon: Material(
            color: Colors.transparent,
            child: GestureDetector(
              child: obscure ? VisibleIcon() : InvisibleIcon(),
              onTap: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            ),
          ),
          obscure: obscure,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          // controller: widgets.controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateMainPass(value),
        );
      },
    );
  }
}
