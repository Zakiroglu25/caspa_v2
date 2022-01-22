import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'copiable_field.dart';

class TurkeyAnbar extends StatelessWidget {
  HiveService get _prefs => locator<HiveService>();
  Adress adress;

  TurkeyAnbar(this.adress);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollBehavior(),
      child: ListView(
        physics: Physics.never,
        padding: Paddings.paddingH20,
        shrinkWrap: true,
        children: [
          CopiableField(
            title: "İsim",
            data: _prefs.user.name,
          ),
          CopiableField(
            title: "Soyisim",
            data: _prefs.user.surname,
          ),
          CopiableField(
            title: "İlçe",
            data: adress.fields?.ilce,
          ),
          CopiableField(
            title: "Adres satır 1",
            data: "${adress.address} ${_prefs.user.username}",
          ),
          CopiableField(
            title: "İl:",
            data: "${adress.fields?.il}",
          ),
          CopiableField(
            title: "Mahalle",
            data: "${adress.fields?.mahalle}",
          ),
          CopiableField(
            title: "Telefon",
            data: "${adress.fields?.telefon}",
          ),
          CopiableField(
            title: "Tc kimlik",
            data: "${adress.fields?.tcKimlik}",
          ),
          CopiableField(
            title: "Posta Kodu",
            data: "${adress.fields?.postaKodu}",
          ),
          CopiableField(
            //  maxLines: 1,
            title: "Adres Başlığı",
            data: "${adress.fields?.adresBashligi}",
          ),
          MySizedBox.h50
        ],
      ),
    );
  }
}
