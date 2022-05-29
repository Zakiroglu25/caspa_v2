import 'package:flutter/material.dart';

import '../../../../widget/main/selectable_package/selectable_package.dart';
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import '../../../../widget/custom/order_select_check_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourierSelectableOrder extends StatelessWidget {
  const CourierSelectableOrder(
      {Key? key,
      this.onTap,
      required this.package,
      required this.index,
      required this.selected})
      : super(key: key);
  final Function? onTap;
  final bool selected;
  final Package package;
  final int index;

  @override
  Widget build(BuildContext context) {
    package.customStatus = MyText.stArrived;
    return Stack(
      fit: StackFit.loose,
      children: [
        SelectablePackage(
          index: index,
          package: package,
          selected: selected,
          price: "${package.price!} TL",
          onTap: () => onTap?.call(),
        ),
        Positioned.fill(
          child: WidgetOrEmpty(
            value: package.payment == 0,
            child: InkWrapper(
              onTap: () => Alert.show(context,
                  image: Icon(
                    Icons.info,
                    size: 80,
                  ),
                  title: MyText.youHaveNotPay,
                  secondButton: CaspaButton(
                    text: MyText.pay,
                    color: MyColors.grey245,
                    textColor: MyColors.black,
                    onTap: () {
                      Go.pop(context);
                      return Go.to(
                          context, Pager.packageDetails(package: package));
                    },
                  ),
                  content: MyText.youMustHaveMakepayment),
              child: Container(
                color: MyColors.white70,
              ),
            ),
          ),
        )
      ],
    );
  }
}
