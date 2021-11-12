import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widget/in_product_image_list.dart';
import 'widget/in_product_info_widget.dart';

class InProductPage extends StatelessWidget {
  InProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Product Name",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
        child: ListView(
          children: [
            SectionName(title: "Foto"),
            MySizedBox.h16,
            InProductImageList(),
            MySizedBox.h48,
            SectionName(title: "Məlumat"),
            MySizedBox.h20,
            InProductInfoWidget(),
          ],
        ),
      ),
    );
  }
}
