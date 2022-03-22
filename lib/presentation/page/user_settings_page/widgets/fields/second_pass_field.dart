import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/widget/icons/invisible_icon.dart';
import 'package:caspa_v2/widget/icons/visible_icon.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPassFieldUser extends StatefulWidget {
  final  controller;

  SecondPassFieldUser({this.controller});

  @override
  State<SecondPassFieldUser> createState() => _SecondPassFieldUserState();
}

class _SecondPassFieldUserState extends State<SecondPassFieldUser> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    // if(widget.controller!.text != '' && widget.controller!.text != null){
    //   BlocProvider.of<UserCubit>(context).updateMainPass(widget.controller!.text);
    // }
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).passSecondStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.passwordAgain,
          maxLines: 1,
          hint: MyText.enter_new_pass_again,

          obscure: obscure,
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
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //infoMessage: MyText.confirm_your_email,
          //controller: widget.controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateSecondPass(value),
        );
      },
    );
  }
}
