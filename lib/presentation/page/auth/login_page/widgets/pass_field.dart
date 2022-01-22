import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/field_c_lear_button.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassField extends StatelessWidget {
  final passController;

  PassField(this.passController); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<LoginCubit>(context).passStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.password,
          maxLines: 1,
          hint: MyText.password,
          // upperCase: false,
          textInputType: TextInputType.text,
          suffixIcon: FieldCLearButton.elseEmpty(
            BlocProvider.of<LoginCubit>(context).uPass.valueOrNull ?? '',
            onTap: () => BlocProvider.of<LoginCubit>(context).updatePass(''),
          ),
          textCapitalization: TextCapitalization.none,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          // controller: passController,
          onChanged: (value) =>
              BlocProvider.of<LoginCubit>(context).updatePass(value),
        );
      },
    );
  }
}
