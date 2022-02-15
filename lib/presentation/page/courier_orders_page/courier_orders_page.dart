import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/boxx.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import '../../../infrastructure/models/remote/response/packages_data.dart';
import '../../../widget/custom/buttons/fade_raised_button.dart';
import '../../../widget/main/product_box/widgets/product_property_v.dart';
import 'widgets/confirm_button.dart';
import 'widgets/general_order_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierOrdersPage extends StatelessWidget {
  const CourierOrdersPage(
      {Key? key,
      required this.phone,
      required this.price,
      required this.packages,
      required this.adress})
      : super(key: key);
  final List<Package> packages;
  final String phone;
  final String adress;
  final String price;
  @override
  Widget build(BuildContext context) {
    final courierCcubit = context.read<CourierCubit>();
    bbbb('ccccc: ${courierCcubit.selectedOrdersId.value}');

    return Scaffold(
        appBar: CaspaAppbar(
          title: MyText.confirm,
          user: false,
          contextA: context,
        ),
        body: SafeArea(
          child: Container(
            //color: MyColors.backMainColor,
            padding: Paddings.paddingH16,
            child: FadeEdge(
              bottomButton: ConfirmButton(),
              child: ListView(
                padding: Paddings.paddingV16,
                shrinkWrap: false,
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: Physics.never,
                      separatorBuilder: (_, __) {
                        return MySizedBox.h8;
                      },
                      itemCount: packages.length * 5,
                      itemBuilder: (context, index) {
                        final Package package = packages[0];
                        return OrderUnicorn(
                          title: '${MyText.package} ${package.id}',
                          sellerName: "${package.store}",
                          trackingCode: "${package.cargoTracking}",
                          statusId: package.payment,
                          deliveryPrice: '${package.cargoPrice}',
                          price: '${package.price}',
                        );
                      }),
                  MySizedBox.h16,
                  SectionName(title: MyText.general_info),
                  ProductPropertyV(
                      h: 12, name: MyText.phone_number, value: phone),
                  ProductPropertyV(
                      h: 12, name: MyText.delivery_adress, value: adress),
                  ProductPropertyV(
                      h: 12,
                      name: MyText.total_price,
                      value: '${price} ${MyText.azn}'),
                  MySizedBox.h90,
                ],
              ),
            ),
          ),
        ));
  }
}
