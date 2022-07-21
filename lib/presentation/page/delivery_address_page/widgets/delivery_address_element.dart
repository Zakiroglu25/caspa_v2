import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../infrastructure/models/remote/response/delivery_address_model.dart';
import '../../../../infrastructure/models/remote/response/regions_model.dart';
import '../../../../widget/custom/buttons/slidable_action_button.dart';
import '../../../../widget/custom/order_select_check_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressElement extends StatelessWidget {
  final Function? onTap;
  final bool selected;
  final int id;
  final DeliveryAddress deliveryAddress;
  final List<Region> regions;
  DeliveryAddressElement(
      {this.onTap,
      required this.id,
      required this.regions,
      required this.selected,
      required this.deliveryAddress});

  @override
  Widget build(BuildContext context) {
    // package.customStatus = MyText.stArrived;
    return Padding(
      padding: Paddings.paddingV1,
      child: Slidable(
        key: Key("id"),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableActionButton(
              color: MyColors.mainOpacity,
              child: SvgPicture.asset(Assets.svgEditIcon),
              onTap: () => context.read<DeliveryAddressCubit>().goToAddPage(
                  context: context,
                  regions: regions,
                  deliveryAddress: deliveryAddress),
            ),
            MySizedBox.w12,
            SlidableActionButton(
              color: MyColors.statusError,
              child: SvgPicture.asset(Assets.svgTrashIcon),
              onTap: () => context
                  .read<DeliveryAddressCubit>()
                  .delete(deliveryAddress.id!),
            ),
          ],
        ),
        child: InkWrapper(
          onTap: () => onTap?.call(),
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              // margin: EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  OrderSelectCheckIndicator(
                    active: selected,
                  ),
                  MySizedBox.w20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ySizedBox.h16,
                        Text("${deliveryAddress.name}",
                            style:
                                AppTextStyles.sanF600.copyWith(fontSize: 16)),
                        MySizedBox.h4,
                        Text("${deliveryAddress.address}",
                            style: AppTextStyles.sanF400Grey),
                        // MySizedBox.h16,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
