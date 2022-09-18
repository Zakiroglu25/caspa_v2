// Flutter imports:

import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'widgets/handle_line.dart';
import 'widgets/title_and_row_buttons.dart';

typedef OnItemSelected = void Function(List<String> selectedPromoCodeNames);

class OptimalBottomSheet extends StatelessWidget {
  final Widget? child;
  final Function? onConfirm;

  final bool? showCloseButton;
  final bool? showConfirmButton;
  final String? title;

  OptimalBottomSheet(
      {this.child,
      this.onConfirm,
      this.title,
      this.showCloseButton,
      this.showConfirmButton});

  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          )),
      // height: 270,
      child: ListView(
        shrinkWrap: true,
        physics: Physics.never,
        children: [
          MySizedBox.h10,
          Center(child: HandleLine(sW)),
          //    MySizedBox.h5,
          titleAndButtons(
              onConfirm: onConfirm,
              showCloseButton: showCloseButton,
              showConfirmButton: showConfirmButton,
              title: title),
          MySizedBox.h26,
          child!,
          MySizedBox.h10
        ],
      ),
    );
  }

  TitleAndRowButtons titleAndButtons(
      {Function? onConfirm,
      bool? showCloseButton,
      bool? showConfirmButton,
      String? title}) {
    return TitleAndRowButtons(
      onConfirm: () {
        onConfirm?.call();
      },
      showCloseButton: showCloseButton,
      showConfirmButton: showConfirmButton,
      title: title,
    );
  }
}
