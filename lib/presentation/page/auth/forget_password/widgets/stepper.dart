import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/margins.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/icons/check_icon.dart';
import 'package:caspa_v2/widget/icons/minus_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassStepper extends StatelessWidget {

  int? current;
  int? stepCount;


  ForgotPassStepper({required this.current,required this.stepCount});

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 40,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return WidgetOrEmpty(
            value: current! < index,
            child: Spin(child: MinusIcon()),
            elseChild: Pulse(child: CheckIcon()),
          );
        },
        itemCount: stepCount!,
        separatorBuilder: (context, index) {
          return Center(
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
          );
        },
      ),
    );
  }
}
