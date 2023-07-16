import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_state.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/widgets/login_fields.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/resizable_content.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/log_reg_buttons.dart';
import 'widgets/login_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        //   bbbb("Ssss: $state");
        if (state is LoginError) {
          Snack.display(message: state.error ?? MyText.error);
        }
      },
      child: ResizableContent(
          footer: Padding(
            padding: Paddings.paddingH16,
            child: LogRegButtons(),
          ),
          child: FadeInUp(
            duration: Duration(milliseconds: 400),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //   Spacer(),
                MySizedBox.h50,
                LoginHeaders(),
                MySizedBox.h20,
                LoginFields(),
                //MySizedBox.h20,
                //Spacer(),
                // LogRegButtons(),
              ],
            ),
          )),
    );
  }
}
