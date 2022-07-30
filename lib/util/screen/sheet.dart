// Flutter imports:
import 'package:caspa_v2/widget/main/caspa_bottom_sheet/optimal_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../widget/general/custom_bottom_sheet.dart' as bs;

class Sheet {
  static display({
    required BuildContext? context,
    Widget? child,
    final OnItemSelected? onItemSelected,
    final Function? onConfirm,
    final bool? showCloseButton = false,
    final bool? showConfirmButton = false,
    final String? title,
  }) {
    //Scaffold.of(context).hideCurrentSnackBar();

    bs.showModalBottomSheet(
        useRootNavigator: true,
        enableDrag: true,
        isDismissible: true,
        barrierColor: Colors.black.withOpacity(.2),
// barrierColor: Colors.red,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        ),
        context: context!,
        builder: (contextZ) => OptimalBottomSheet(
              child: child!,
              onConfirm: onConfirm,
              showCloseButton: showCloseButton,
              showConfirmButton: showConfirmButton,
              title: title,
            ));
  }
}
