import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/phone_formatter.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import '../../../../util/formatter/masked_text_controller_phone.dart';
import 'fields/birthday_field.dart';
import 'fields/id_serie_field.dart';
import 'save_attorney_button.dart';

class AddOrEditFieldsAttorneyListView extends StatelessWidget {
  Attorney? attorney;

  AddOrEditFieldsAttorneyListView({this.attorney});
  var maskedController = MaskedTextController(mask: '(000) 000-0000');

  final TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addAttorneysCubit = context.watch<AddAttorneysCubit>();
    if (attorney != null) {
      bbbb("pppppp:  ${attorney}");
      //  bbbb("pppppp:  ${attorney!.phone}");
      addAttorneysCubit.fin_controller.text = attorney!.fin!;
      addAttorneysCubit.birthDate.sink.add(attorney!.birthday!);
      addAttorneysCubit.full_name_controller.text = attorney!.fullName!;
      addAttorneysCubit.phone_controller.text = attorney!.phone!;
      addAttorneysCubit.id_number_controller.text =
          StringOperations.idNumberFromFullId(attorney!.idNumber!);
      addAttorneysCubit.serieType.sink
          .add(StringOperations.idSerieFromFullId(attorney!.idNumber!));
      addAttorneysCubit.father_name_controller.text = attorney!.fatherName!;
      addAttorneysCubit.note_controller.text = "";
    }
    return ListView(
      padding: Paddings.paddingA16,
      children: [
        CaspaField(
          title: MyText.name_surname,
          hint: MyText.name_surname,
          controller: addAttorneysCubit.full_name_controller,
        ),
        CaspaField(
          title: MyText.father_name,
          hint: MyText.father_name,
          controller: addAttorneysCubit.father_name_controller,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IdSerieFieldAddAttorney(),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 1.5) + 10,
              child: CaspaField(
                title: MyText.card_id,
                hint: MyText.card_id,
                controller: addAttorneysCubit.id_number_controller,
              ),
            ),
          ],
        ),
        CaspaField(
          title: MyText.fin,
          hint: MyText.fin,
          controller: addAttorneysCubit.fin_controller,
        ),
        BirthdayFieldAttorney(birthdayController),
        CaspaField(
          title: MyText.phone_number,
          hint: MyText.phone_example,
          textInputType: TextInputType.phone,
          formatters: [
            // PhoneNumberFormatter(with994: false),
            // PhoneMaskFormatter(),
            //_NumberTextInputFormatter(1)
          ],
          maxLenght: 15,
          controller: addAttorneysCubit.phone_controller,
        ),
        CaspaField(
          title: MyText.note,
          hint: MyText.note,
          controller: addAttorneysCubit.note_controller,
        ),
        MySizedBox.h16,
        SaveAttorneyButton(
          attorney: attorney,
        ),
      ],
    );
  }
}
