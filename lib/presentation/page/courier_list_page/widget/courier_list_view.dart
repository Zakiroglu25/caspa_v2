import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/courier_orders_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/shop_list.dart';
import 'package:caspa_v2/presentation/page/courier_list_page/widget/courier_unicorn.dart';
import 'package:caspa_v2/presentation/page/shops_page/widgets/shop_unicorn.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/string_operations.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/delegate/pager.dart';

class CourierListView extends StatelessWidget {
  final List<CourierOrder> courierList;
  CourierListView(this.courierList);

  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
        list: courierList,
        child: ListView.builder(
          itemCount: courierList.length,
          padding: Paddings.paddingA16,
          itemBuilder: (context, index) {
            return CourierUnicorn(
              courier: courierList[index],
            );
          },
        ));
  }
}
