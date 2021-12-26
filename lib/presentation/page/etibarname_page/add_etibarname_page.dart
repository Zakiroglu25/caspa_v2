import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class AddEtibarname extends StatelessWidget {
   AddEtibarname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addAttorneysCubit = context.watch<AddAttorneysCubit>();
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        centerTitle: true,
        title: "Yeni etibarnamə",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CaspaField(
              title: "Ad,Soayd",
              hint: "Ad,Soyad",
              controller: addAttorneysCubit.full_name_controller,
            ),

            CaspaField(
              title: "Ata adı",
              hint: "Ata adı",
              controller: addAttorneysCubit.father_name_controller,
            ),
            CaspaField(
              title: "Ş/V-nin nömrəsi",
              hint: "Ş/V-nin nömrəsi",
              controller: addAttorneysCubit.id_number_controller,
            ),
            CaspaField(
              title: "FİN kod",
              hint: "FİN kod",
              controller: addAttorneysCubit.fin_controller,
            ),
            CaspaField(
              title: "Doğum tarixi",
              hint: "Ad",
              controller: addAttorneysCubit.birthday_controller,
            ),
            CaspaField(
              title: "Əlaqə nömrəsi",
              hint: "Əlaqə nömrəsi",
              controller: addAttorneysCubit.phone_controller,
            ),
            CaspaField(
              title: "note",
              hint: "note",
              controller: addAttorneysCubit.note_controller,
            ),
            MySizedBox.h16,
            CaspaButton(
              text: "Yadda saxla",
              onTap: () {
                context.read<AddAttorneysCubit>().addAttorney();
              },
            ),
          ],
        ),
      ),
    );
  }
}
