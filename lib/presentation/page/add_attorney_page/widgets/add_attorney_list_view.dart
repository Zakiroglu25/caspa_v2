import 'package:caspa_v2/presentation/page/add_attorney_page/widgets/save_attorney_button.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/widget/fields/id_serie_field.dart';
import 'package:flutter/material.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/widget/fields/birthday_field.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/formatter/phone_formatter.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class AddAttorneyListView extends StatelessWidget {
  const AddAttorneyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addAttorneysCubit = context.watch<AddAttorneysCubit>();
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
              width: (MediaQuery.of(context).size.width/1.5)+10,
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
        BirthdayFieldAttorney(),
        CaspaField(
          title: MyText.phone_number,
          hint: MyText.phone_number,
          textInputType: TextInputType.phone,
          formatters: [PhoneNumberFormatter(with994: false)],
          maxLenght: 15,
          controller: addAttorneysCubit.phone_controller,
        ),
        CaspaField(
          title: MyText.note,
          hint: MyText.note,
          controller: addAttorneysCubit.note_controller,
        ),
        MySizedBox.h16,
        SaveAttorneyButton(),
      ],
    );
  }
}
