import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';

class AddEtibarname extends StatelessWidget {
  const AddEtibarname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              title: "Ad",
              hint: "Ad",
            ),
            CaspaField(
              title: "Soyad",
              hint: "Soyad",
            ),
            CaspaField(
              title: "Ata adı",
              hint: "Ata adı",
            ),
            CaspaField(
              title: "Ş/V-nin nömrəsi",
              hint: "Ş/V-nin nömrəsi",
            ),
            CaspaField(
              title: "FİN kod",
              hint: "FİN kod",
            ),
            CaspaField(
              title: "Doğum tarixi",
              hint: "Ad",
            ),
            CaspaField(
              title: "Əlaqə nömrəsi",
              hint: "Əlaqə nömrəsi",
            ),
            MySizedBox.h16,
            CaspaButton(
              text: "Yadda saxla",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
