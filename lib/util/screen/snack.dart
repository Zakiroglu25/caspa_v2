// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/constants/boxx.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget_or_empty.dart';
// Project imports:

class Snack {
  static display({
    required BuildContext? context,
    required String message,
    bool? positive = false,
    bool showSuccessIcon = false,
    Color color = MyColors.newGREEN,
  }) {
    //Scaffold.of(context).hideCurrentSnackBar();
    //positive ?? false;
    final SnackBar snackbar = SnackBar(
      key: Key('a'),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(right: 0),
      content: Container(
        decoration: BoxDecoration(
            //color: MyColors.mainColor,
            color: (positive!) ? color : MyColors.errorRED,
            // gradient: (positive??false) ? Gradients.gBlues : Gradients.gReds,
            borderRadius: BorderRadius.circular(10)),
        height: 50.sp,
        // height: 60.sp,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              //color: MyColors.mainColor,
              //margin: EdgeInsets.only(left: (!positive || showSuccessIcon)?50:16),
              padding: EdgeInsets.only(
                  left: (!positive || showSuccessIcon) ? 40 : 16,
                  right: (!positive || showSuccessIcon) ? 40 : 16),
              child: Center(
                child: Text(
                  message
                  //?? 'error_during_operation'
                  ,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: !showSuccessIcon ? 14.sp : 14.sp),
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
                          //     MySizedBox.w8,
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );

    // bbbb(
    //     "tester: ${NavigationService.instance.navigationKey!.currentWidget!.toString()}");
    // bbbb(
    //     "tester 2: ${ModalRoute.of(NavigationService.instance.navigationKey!.currentState!.context)!.settings.name}");
    ScaffoldMessenger.of(context!)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      //..removeCurrentMaterialBanner()
      ..showSnackBar(snackbar);
  }

  static positive({
    required BuildContext? context,
    required String? message,
    bool? positive = true,
    bool showSuccessIcon = true,
    Color color = MyColors.green,
  }) {
    //Scaffold.of(context).hideCurrentSnackBar();
    //positive ?? false;
    final snackbar = SnackBar(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.only(right: 0),
      content: BounceInUp(
        child: Container(
          decoration: BoxDecoration(
              //color: MyColors.mainColor,
              color: (positive!) ? color : MyColors.errorRED,
              // gradient: (positive??false) ? Gradients.gBlues : Gradients.gReds,
              borderRadius: BorderRadius.circular(10)),
          height: 50.sp,
          // height: 60.sp,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                //color: MyColors.mainColor,
                //margin: EdgeInsets.only(left: (!positive || showSuccessIcon)?50:16),
                padding: EdgeInsets.only(
                    left: (!positive || showSuccessIcon) ? 40 : 16,
                    right: (!positive || showSuccessIcon) ? 40 : 16),
                child: Center(
                  child: Text(
                    message ?? 'error_during_operation',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: !showSuccessIcon ? 14.sp : 14.sp),
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
                            //     MySizedBox.w8,
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

    ScaffoldMessenger.of(
        NavigationService.instance.navigationKey!.currentState!.context)
      ..hideCurrentSnackBar()
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
