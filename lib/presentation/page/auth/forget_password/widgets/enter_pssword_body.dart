import 'package:flutter/material.dart';

//class EnterPsswordBody extends StatelessWidget {


import 'package:flutter/material.dart';

//class EnterCodeBody extends StatelessWidget {



import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordBody extends StatelessWidget {
  const EnterPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Paddings.paddingH20,
      child: Column(
        children: [
          Container(
            child: Text(
              "confirm password",
              style: AppTextStyles.coHead600,
            ),
          ),
          CaspaButton(
            text: "confirm password",
            onTap: () {
              context.read<ForgotPassCubit>().changeState(context: context);
            },
          ),
          CaspaButton(
            text: "back",
            onTap: () {
              context
                  .read<ForgotPassCubit>()
                  .changeState(back: true,context: context);
            },
          )
        ],
      ),
    );
  }
}
