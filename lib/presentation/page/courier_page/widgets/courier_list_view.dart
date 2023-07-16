import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/presentation/page/courier_page/widgets/delivery_address_select_field.dart';
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

import '../../../../infrastructure/models/remote/response/courier_orders_model.dart';
import '../../../../infrastructure/models/remote/response/delivery_address_model.dart';
import 'courier_continue_button.dart';
import 'courier_info_box.dart';
import 'order_list.dart';

class CourierPageListView extends StatelessWidget {
  final List<Package>? packageList;
  final List<Region>? regionList;
  final CourierOrder? courierOrder;
  final DeliveryAddress? address;
  CourierPageListView(
      {required this.packageList,
      this.address,
      required this.regionList,
      this.courierOrder});

  @override
  Widget build(BuildContext context) {
    if (courierOrder != null) {
      bbbb("courierOrder: $address");
    }

    return ListOrEmpty(
      list: packageList,
      text: MyText.youMustHaveProduct,
      child: FadeEdge(
        bottomButton: CourierContinueButton(
          courierOrder: courierOrder,
        ),
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
                MySizedBox.h16,
                CourierInfoBox(),
                MySizedBox.h24,
                SectionName(title: MyText.deliveryInfo),
                MySizedBox.h16,
                DeliveryAddressSelectField(address: address),
                MySizedBox.h16,
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
