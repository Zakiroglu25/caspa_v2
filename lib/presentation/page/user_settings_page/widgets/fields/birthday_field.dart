
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/register/widgets/field_c_lear_button.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BirthdayFieldUser extends StatelessWidget {
   TextEditingController controller ;


  BirthdayFieldUser({required this.controller});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<UserCubit>(context).birthDateStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.birthday,
          maxLines: 1,
          hint: MyText.birthday,
          upperCase: true,
          textInputType: TextInputType.datetime,
          textCapitalization: TextCapitalization.sentences,
          readOnly: true,
          suffixIcon: FieldCLearButton(
            BlocProvider.of<UserCubit>(context).birthDate.valueOrNull!,
            onTap: () {
              BlocProvider.of<UserCubit>(context).updateBirthDate('');
            },
          ),
         // errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          onTap: () {
            _openDatePicker(context, controller, null);
          },
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<UserCubit>(context).updateBirthDate(value),
        );
      },
    );
  }

  Future<void> _openDatePicker(BuildContext context,
      TextEditingController? birtController, String? initial) async {
    if (birtController?.text == null) {
      initial = DateFormat("dd-MM-yyyy")
          .format(DateTime(DateTime.now().year - 18, 12, 31))
          .toString();
      birtController?.text = initial;
      BlocProvider.of<UserCubit>(context).updateBirthDate(
          new DateFormat("dd-MM-yyyy")
              .format(DateTime(DateTime.now().year - 18, 12, 31))
              .toString());
    }
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext contextZ) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: MyColors.mainColor,
                      child: IconButton(
                        icon: Icon(Icons.done, color: MyColors.secondMainColor),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Icon(Icons.close, color: MyColors.mainColor),
                        onPressed: () {
                          // BlocProvider.of<RegCubit>(context).updateBirthday("~");
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime(DateTime.now().year - 18, 12, 31),
                    onDateTimeChanged: (DateTime chosenDate) {
                      initial = new DateFormat("dd-MM-yyyy")
                          .format(chosenDate)
                          .toString();
                      birtController?.text = new DateFormat("dd-MM-yyyy")
                          .format(chosenDate)
                          .toString();
                      BlocProvider.of<UserCubit>(context).updateBirthDate(
                          new DateFormat("dd-MM-yyyy")
                              .format(chosenDate)
                              .toString());
                    },
                    maximumYear: DateTime.now().year - 13,
                    minimumYear: 1900,
                    mode: CupertinoDatePickerMode.date,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
