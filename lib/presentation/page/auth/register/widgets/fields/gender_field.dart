import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/selectable/gender_list.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/enums/gender_type.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderFieldRegister extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  GenderType selected = GenderType.unselected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<RegisterCubit>(context).genderStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.gender,
          maxLines: 1,
          hint: MyText.gender,
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          //  errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          readOnly: true,
          onTap: () => Sheet.display(
              context: context,
              child: GenderList(
                selected: selected,
                contextZ: context,
                controller: controller,
                onItemSelected: (a) {
                  if (a != null) {
                    selected = a.type!;
                  }
                  //  bbbb("selected: "+(a?.value) .toString());

                  BlocProvider.of<RegisterCubit>(context)
                      .updateGender(a?.value);
                },
              )),
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<RegisterCubit>(context).updateGender(value),
        );
      },
    );
  }
}
