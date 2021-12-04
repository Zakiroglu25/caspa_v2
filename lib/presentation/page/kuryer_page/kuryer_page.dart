import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/presentation/page/kuryer_page/widgets/courier_order.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/constants/text_styles.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/caspa_page_head_image.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:caspa_v2/widget/general/text_field_on_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/courier_continue_button.dart';
import 'widgets/order_list.dart';
import 'widgets/order_select_indicator.dart';

class KuryerPage extends StatefulWidget {
  KuryerPage({Key? key}) : super(key: key);

  @override
  State<KuryerPage> createState() => _KuryerPageState();
}

class _KuryerPageState extends State<KuryerPage> {
  int selectedTool = 0;

 // List<int> selectedOrders = [];

  List<dynamic> orders = [
    {
      'id': 1,
      'name': 'Massimo Dutti',
      'date': '08.09.1993',
    },
    {
      'id': 2,
      'name': 'Pull & Bear ',
      'date': '08.09.1993',
    },
    {
      'id': 3,
      'name': 'Figma',
      'date': '08.09.1993',
    },
    {
      'id': 4,
      'name': 'Pull & Bear ',
      'date': '08.09.1993',
    },
    {
      'id': 5,
      'name': 'Figma',
      'date': '08.09.1993',
    },
    {
      'id': 6,
      'name': 'Pull & Bear ',
      'date': '08.09.1993',
    },
    {
      'id': 7,
      'name': 'Figma',
      'date': '08.09.1993',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.courierOrder,
        user: false,
        notification: false,
        centerTitle: true,
        contextA: context,
      ),
      body: FadeEdge(
        bottomButton: CourierContinueButton(),
        child: ListView(
          padding: Paddings.paddingH16,
          children: [

            ColorfullBackImage(path: Assets.pngMoto,infoTitle: MyText.therIsYourData,infoContent: MyText.kuryerTxt,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySizedBox.h24,
                SectionName(title: MyText.deliveryInfo),
                MySizedBox.h16,
                CaspaField(
                  hint: '+994 ... .. ..',
                  title: 'Nomre',
                ),
                CaspaField(
                  title: "Rayon",
                  hint: 'Rayonu daxil edin',
                ),
                CaspaField(
                  title: "Ünvan",
                  hint: 'Burada ünvanı qeyd edə bilərsiniz',
                ),
                SectionName(title: MyText.selectOrder),
                MySizedBox.h20,
                OrderList(
                  orders: orders,
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
