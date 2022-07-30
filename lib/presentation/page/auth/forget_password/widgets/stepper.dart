import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/margins.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/icons/check_icon.dart';
import 'package:caspa_v2/widget/icons/minus_icon.dart';
import 'package:flutter/material.dart';

class ForgotPassStepper extends StatelessWidget {
  int? current;
  int? stepCount;
  List<String>? titles;
  ForgotPassStepper(
      {required this.current, required this.stepCount, this.titles});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: titles != null ? 65 : 40,
      color: MyColors.transparent,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetOrEmpty(
                value: current! < index,
                child: Spin(child: MinusIcon()),
                elseChild: Pulse(child: CheckIcon()),
              ),
              titles != null
                  ? Column(
                      children: [
                        MySizedBox.h10,
                        SizedBox(
                          height: 30,
                          width: 32,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              titles![index],
                              textAlign: TextAlign.center,
                              style:
                                  AppTextStyles.sanF400.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          );
        },
        itemCount: stepCount!,
        separatorBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: WidgetOrEmpty(
                  value: current! - 1 < index,
                  child: Container(
                    margin: Margins.marginH4,
                    width: 24,
                    height: 2,
                    color: MyColors.grey226,
                  ),
                  elseChild: Flash(
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      margin: Margins.marginH4,
                      width: 24,
                      height: 2,
                      color: MyColors.green,
                    ),
                  ),
                ),
              ),
              titles != null
                  ? SizedBox(
                      height: 40,
                    )
                  : Container()
            ],
          );
        },
      ),
    );
  }
}
