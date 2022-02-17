import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_state.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/widgets/order_unicorn.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/fade_edge.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import '../../../infrastructure/cubits/package_details/package_details_cubit.dart';
import '../../../infrastructure/cubits/package_details/package_details_state.dart';
import '../../../infrastructure/models/remote/response/packages_data.dart';
import '../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../util/constants/assets.dart';
import '../../../util/delegate/navigate_utils.dart';
import '../../../util/screen/alert.dart';
import '../../../util/screen/full_screen_loading.dart';
import '../../../util/screen/snack.dart';
import '../../../widget/general/caspa_radio.dart';
import '../../../widget/main/product_box/widgets/product_property_v.dart';
import '../webview_page/webview_page.dart';
import 'widgets/confirm_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierOrdersPage extends StatelessWidget {
  const CourierOrdersPage(
      {Key? key,
      required this.phone,
      required this.price,
      required this.region,
      required this.packages,
      required this.adress})
      : super(key: key);
  final List<Package> packages;
  final String phone;
  final String adress;
  final String price;
  final Region region;

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
          child: BlocConsumer<PackageDetailsCubit, PackageDetailsState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is PackageDetailsPayError) {
                Snack.display(context: context, message: state.error);
              }
              if (state is PackageDetailsInProgress) {
                FullScreenLoading.display(context);
              } else {
                FullScreenLoading.hide(context);
              }
              if (state is PackageDetailsPaid) {
                Go.to(context, Pager.success());
                Snack.positive(
                    context: context, message: MyText.operationIsSuccess);
              }
            },
            builder: (context, state) {
              if (state is PackageDetailsUrlFetched) {
                return WebviewPage(
                  url: state.url,
                  mainContext: context,
                  whenSuccess: () => context
                      .read<PackageDetailsCubit>()
                      .paymentSuccess(context),
                );
              }
              return BlocListener<CourierCubit, CourierState>(
                listener: (context, state) {
                  if (state is CourierAdded) {
                    Alert.body(context,
                        title: MyText.choosePaypentType,
                        cancelButton: true,
                        buttonText: MyText.goOn,
                        onTap: () => context
                            .read<PackageDetailsCubit>()
                            .courierMakePayment(
                                context: context, id: state.courierId),
                        image: Image.asset(
                          Assets.linkGirl,
                          width: 100,
                          height: 100,
                        ),
                        content: StreamBuilder(
                          stream: BlocProvider.of<PackageDetailsCubit>(context)
                              .payTypeStream,
                          builder: (contextK, snapShoot) {
                            return ListView(
                              shrinkWrap: true,
                              padding: Paddings.paddingV12,
                              children: [
                                buildCaspaRadio(context, snapShoot,
                                    value: MyText.fromBalance),
                                buildCaspaRadio(context, snapShoot,
                                    value: MyText.byCard),
                                buildCaspaRadio(context, snapShoot,
                                    value: MyText.fromCashback),
                                // buildCaspaRadio(context, snapShoot,
                                //     value: MyText.withPromoCode),
                              ],
                            );
                          },
                        ));
                  }
                },
                child: Container(
                  //color: MyColors.backMainColor,
                  padding: Paddings.paddingH16,
                  child: FadeEdge(
                    bottomButton: ConfirmButton(
                        packages: packages,
                        price: price,
                        phone: phone,
                        adress: adress,
                        region: region),
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
                            itemCount: packages.length,
                            itemBuilder: (context, index) {
                              final Package package = packages[index];
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
                            h: 12,
                            name: MyText.phone_number,
                            value: "+994 ${phone}"),
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
              );
            },
          ),
        ));
  }

  CaspaRadio buildCaspaRadio(
      BuildContext context, AsyncSnapshot<Object?> snapShoot,
      {required String value}) {
    return CaspaRadio(
        onTap: () => context.read<PackageDetailsCubit>().updatePayType(value),
        title: value,
        isActive: snapShoot.data == value);
  }
}
