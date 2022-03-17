import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/birthday_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/cardIdField.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/finField.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/main_pass_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/number_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/second_pass_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/fields/surname_field.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/register_button.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/register_type.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/single_child_bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../fields/adress_field.dart';
import '../fields/email_field.dart';
import '../fields/gender_field.dart';
import '../fields/name_field.dart';
import '../fields/policy_checkbox.dart';

class CivilRegisterTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  context.read<RegisterCubit>().registerType = RegisterType.personal;

    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (context, state) {
        if (state is RegisterButtonActive)
          return false;
        else
          return true;
      },
      listener: (context, state) {
        if (state is RegisterLoading) {
          FullScreenLoading.display(context, text: MyText.processing);
        }
        if (state is RegisterFailed) {
          FullScreenLoading.hide(context);
          Snack.display(
              context: context, message: state.message ?? MyText.error);
        }
        if (state is RegisterSuccess) {
          Snack.display(
              context: context,
              message: MyText.operationIsSuccess,
              positive: true,
              showSuccessIcon: true);
        }
      },
      child: Stack(
        children: [
          SingleChildBounce(
              padding: Paddings.paddingH16 +
                  EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  MySizedBox.h24,
                  NameFieldRegister(),
                  MySizedBox.h3,
                  SurNameFieldRegister(),
                  MySizedBox.h3,
                  PhoneFieldRegister(),
                  MySizedBox.h3,
                  EmailFieldRegister(),
                  MySizedBox.h3,
                  BirthdayFieldRegister(),
                  MySizedBox.h3,
                  AdressFieldRegister(),
                  //MySizedBox.h3,
                  //AnbarFieldRegister(),
                  MySizedBox.h3,
                  MainPassFieldRegister(),
                  MySizedBox.h3,
                  SecondPassFieldRegister(),
                  MySizedBox.h3,
                  FinFieldRegister(),
                  MySizedBox.h3,
                  CardIdFieldRegister(),
                  MySizedBox.h3,
                  GenderFieldRegister(),

                  PolicyCheckbox(),
                  MySizedBox.h90,
                ],
              )),
          RegisterButton(
            registerType: RegisterType.personal,
          )
        ],
      ),
    );
  }
}
