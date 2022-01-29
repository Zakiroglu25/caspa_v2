import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/presentation/page/courier_page/widgets/order_select_indicator.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';

class CaspaRadio extends StatelessWidget {
  Function? onTap;
  String? title;
  int? id;
  bool? isActive;

  CaspaRadio(
      {required this.onTap,
      required this.title,
      this.id,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      child: Container(
        // height: 35,
        padding: Paddings.paddingV8 + Paddings.paddingH16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title!,
                style: TextStyle(
                    color:
                        //  selectedGenderType == gender!.type
                        //    ? MyColors.mainColor
                        //  :

                        Colors.black),
              ),
            ),
            //context.read<RegisterCubit>().
            MySizedBox.w5,

            FlipInY(
                duration: Duration(milliseconds: 500),
                child: OrderSelectIndicator(
                  active: isActive,
                  w: 14,
                  h: 14,
                ))

            //:
          ],
        ),
      ),
      onTap: () {
        onTap?.call();
      },
    );
  }
}
