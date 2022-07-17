import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../widget/custom/buttons/slidable_action_button.dart';
import '../../../../widget/custom/order_select_check_indicator.dart';

class SelectableAddAddress extends StatelessWidget {
  Function? onTap;
  bool selected;
  int id;

  SelectableAddAddress({this.onTap, required this.id, required this.selected});

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
              onTap: null,
            ),
            MySizedBox.w12,
            SlidableActionButton(
              color: MyColors.statusError,
              child: SvgPicture.asset(Assets.svgTrashIcon),
              onTap: null,
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
                        Text("Adress $id",
                            style:
                                AppTextStyles.sanF600.copyWith(fontSize: 16)),
                        MySizedBox.h4,
                        Text("Adress description $id",
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
