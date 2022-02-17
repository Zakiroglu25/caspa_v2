import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';

import 'courier_continue_button.dart';
import 'fields/adress_field.dart';
import 'fields/number_field.dart';
import 'fields/region_field.dart';
import 'order_list.dart';

class CourierListView extends StatelessWidget {
  final List<Package>? packageList;
  final List<Region>? regionList;

  CourierListView({required this.packageList, required this.regionList});

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
      list: packageList,
      text: MyText.youMustHaveProduct,
      child: FadeEdge(
        bottomButton: CourierContinueButton(),
        child: ListView(
          padding: Paddings.paddingH16,
          children: [
            ColorfullBackImage(
              path: Assets.pngMoto,
              infoTitle: MyText.therIsYourData,
              infoContent: MyText.kuryerTxt,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySizedBox.h24,
                SectionName(title: MyText.deliveryInfo),
                MySizedBox.h16,
                PhoneFieldCourier(),
                RegionFieldCourier(
                  regionList: regionList,
                ),
                AdressFieldCourier(),
                SectionName(title: MyText.selectOrder),
                MySizedBox.h20,
                OrderList(
                  packageList: packageList!,
                  //  selectedOrders: selectedOrders,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
