// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/gradients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_or_empty.dart';
// Project imports:

class Snack {
  static display({
    required BuildContext? context,
    String? message,
    bool? positive=false,
    bool showSuccessIcon = false,
  }) {
    //Scaffold.of(context).hideCurrentSnackBar();
    //positive ?? false;
    final snackbar = SnackBar(
      elevation: 0,
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(right: 0),
      content: BounceInUp(
        child: Container(
          decoration:  BoxDecoration(
            //color: MyColors.mainColor,
              color: (positive!)? MyColors.mainColor: MyColors.errorRED,
             // gradient: (positive??false) ? Gradients.gBlues : Gradients.gReds,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          height: 50.sp,
          child: Stack(
            children: [
              Container(
                  //color: MyColors.mainColor,
                //margin: EdgeInsets.only(left: (!positive || showSuccessIcon)?50:16),
                padding: EdgeInsets.only(
                    left: (!positive || showSuccessIcon) ? 34 : 16,
                    right: (!positive || showSuccessIcon) ? 34 : 16),
                child: Center(
                  child: Text(
                    message ?? 'error_during_operation',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: !showSuccessIcon ? 14.sp : 16.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: WidgetOrEmpty(
                      value: (!positive),
                      elseChild: WidgetOrEmpty(
                        value: showSuccessIcon,
                        child: Container(
                          width: 28,
                          child: Row(
                            children: [
                              Flash(
                                  child: const Icon(
                                Icons.check_sharp,
                                color: Colors.white,
                              )),
                              //    MySizedBox.w16,
                            ],
                          ),
                        ),
                      ),
                      child: Container(
                        width: 28,
                        child: Row(
                          children: [
                            Flash(
                                child: const Icon(
                              Icons.error_outline_sharp,
                              color: Colors.white,
                            )),
                            // MySizedBox.w16,
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );

    ScaffoldMessenger.of(context!)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
