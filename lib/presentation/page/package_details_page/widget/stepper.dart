import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/margins.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/status_list.dart';
import 'package:caspa_v2/util/delegate/random.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/icons/check_icon.dart';
import 'package:caspa_v2/widget/icons/minus_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageStepper extends StatelessWidget {
  List<String> titles;
  List<Archive> currentStatustes;
  PackageStepper({required this.titles, required this.currentStatustes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: titles != null ? 80 : 40,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: Physics.never,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      //  final mainAGreement=StatusList.fromStatusToStep(element.status!) == titles[index];

                      return WidgetOrEmpty(
                        value: currentStatustes.any((element) =>
                            StatusList.fromStatusToStep(element.status!) ==
                            titles[index]),
                        elseChild: Spin(
                            child: RotatedBox(
                                quarterTurns: (currentStatustes.isNotEmpty &&
                                        StatusList.fromStatusToStep(
                                                currentStatustes
                                                    .last.status!) ==
                                            titles[index])
                                    ? 1
                                    : 0,
                                child: MinusIcon())),
                        child: Pulse(child: CheckIcon()),
                      );
                    },
                    itemCount: titles.length,
                    separatorBuilder: (context, index) {
                      return Center(
                        child: WidgetOrEmpty(
                          value: currentStatustes.any((element) =>
                              StatusList.fromStatusToStep(element.status!) ==
                              titles[index]),
                          elseChild: Container(
                            margin: Margins.marginH4,
                            width: 34,
                            height: 2,
                            color: MyColors.grey226,
                          ),
                          child: Flash(
                            duration: Duration(milliseconds: 800),
                            child: Container(
                              margin: Margins.marginH4,
                              width: 34,
                              height: 2,
                              color: MyColors.green,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 40,
                  padding: Paddings.paddingH16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        titles.length,
                        (index) => Column(
                              children: [
                                MySizedBox.h10,
                                Container(
                                  height: 30,
                                  width: 66,
                                  padding: Paddings.paddingH1,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      titles[index],
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.sanF400
                                          .copyWith(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
