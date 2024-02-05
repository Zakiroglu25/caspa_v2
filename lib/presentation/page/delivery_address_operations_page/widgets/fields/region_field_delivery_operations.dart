import 'package:caspa_v2/infrastructure/cubits/delivery_adress_operations/delivery_address_operations_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/regions_model.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/sheet.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/app_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionFieldDeliveryOperations extends StatelessWidget {
  final TextEditingController? controller;
  final List<Region>? regionList;
  final Region? selectedRegion;

  RegionFieldDeliveryOperations(
      {this.controller,
      this.selectedRegion,
      required this.regionList}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (selectedRegion != null) {
      BlocProvider.of<DeliveryAdressOperationsCubit>(context)
          .updateRegion(selectedRegion);
    }
    return StreamBuilder(
        stream: BlocProvider.of<DeliveryAdressOperationsCubit>(context).region,
        builder: (contextP, snapShoot) {
          final currentRegion =
              BlocProvider.of<DeliveryAdressOperationsCubit>(context)
                  .region
                  .valueOrNull;
          return CaspaField(
            readOnly: true,
            //suffixIcon: FieldLoading(state),
            hint: MyText.tapForselectRegion,
            controller: TextEditingController.fromValue(TextEditingValue(
                text: currentRegion != null
                    ? ("${currentRegion.name} ${currentRegion.price} AZN")
                    : "")),
            title: MyText.region,
            onTap: () => regionList != null
                ? showSheet(context, regionList)
                : Snack.display(
                    context: context, message: MyText.none_category_is_found),
          );
        });
  }

  showSheet(BuildContext context, List<Region>? regionsList) {
    if (regionsList != null && regionsList.length != 0) {
      List<Region> regions = regionsList;
      final sH = MediaQuery.of(context).size.height - 56 - 90;
      final listHeight = regions.length * 35.0;

      Sheet.display(
          context: context,
          child: SizedBox(
            //height: 100,
            height: listHeight > sH ? sH : listHeight,
            child: StreamBuilder(
                stream: BlocProvider.of<DeliveryAdressOperationsCubit>(context)
                    .region,
                builder: (contextP, snapShoot) {
                  return ListView.builder(
                      physics: Physics.alwaysBounce,
                      shrinkWrap: false,
                      itemCount: regions.length,
                      itemBuilder: (contextK, index) {
                        Region currentRegion = regions[index];

                        return AppRadio(
                          onTap: () {
                            BlocProvider.of<DeliveryAdressOperationsCubit>(
                                    context)
                                .updateRegion(currentRegion);
                            // Navigator.of(context).pop();
                            Go.pop(context);
                            //Go.pop(context);
                          },
                          title:
                              ("${currentRegion.name} ${currentRegion.price} AZN"),
//isActive: false,
                          isActive:
                              BlocProvider.of<DeliveryAdressOperationsCubit>(
                                          context)
                                      .region
                                      .valueOrNull
                                      ?.id ==
                                  currentRegion.id,
                        );
                      });
                }),
          ));
    } else {
      Snack.display(context: context, message: MyText.none_category_is_found);
    }
  }
}
