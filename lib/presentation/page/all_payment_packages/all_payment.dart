import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/extensions/smart.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';

import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/colors.dart';
import '../../../util/constants/text.dart';

class AllPaymentPackages extends StatefulWidget {
  const AllPaymentPackages({Key? key}) : super(key: key);

  @override
  State<AllPaymentPackages> createState() => _AllPaymentPackagesState();
}

class _AllPaymentPackagesState extends State<AllPaymentPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        notification: false,
        title: '',
        contextA: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Toplam ödəniş et",
              style: AppTextStyles.coHead500.copyWith(fontSize: 25),
            ),
            MySizedBox.h20,
            Text(
              "Ödəniş edəcəyiniz bağlamaları seçərək alt hissədə toplam məbləğ əks olunacaq. Əyər məbləğ sizi qane edirsə “Ödə” düyməsinin üzərindən klik edin.",
              style: AppTextStyles.sanF400
                  .copyWith(fontSize: 14.sm, color: MyColors.grey165),
            )
          ],
        ),
      ),
    );
  }
}
