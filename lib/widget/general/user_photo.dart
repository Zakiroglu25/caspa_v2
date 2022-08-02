import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import '../../locator.dart';
import '../../util/constants/text.dart';
import '../../util/delegate/navigate_utils.dart';
import '../../util/screen/ink_wrapper.dart';
import 'photo_with_url.dart';

class UserPhoto extends StatelessWidget {
  double? h;
  double? w;
  String? url;
  bool editOnTap;
  UserPhoto({this.h, this.w, this.url, this.editOnTap = false});

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<File?>(
      stream: BlocProvider.of<UserCubit>(context).imageStream,
      builder: (context, snapshot) {
        BehaviorSubject<File?> image = context.read<UserCubit>().image;
        return InkWrapper(
          tapable: editOnTap,
          splashColor: MyColors.transparent,
          highlightColor: MyColors.transparent,
          onTap: () {
            if (editOnTap) {
              Alert.body(context,
                  buttonText: MyText.gallery,
                  textAlign: TextAlign.center,
                  title: MyText.youMustSelectOneOfThem,
                  image: MySizedBox.h16,
                  onTap: () =>
                      context.read<UserCubit>().checkAndPickImage(context),
                  secondButton: CaspaButton(
                    onTap: () {
                      Go.pop(context);
                      context.read<UserCubit>().checkAndTake(context);
                    },
                    text: MyText.camera,
                  ));
            }
          },
          child: Container(
              height: h ?? 100.sp,
              width: w ?? 100.sp,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.sp),
                  child: image.hasValue
                      ? Flash(
                          key: Key(image.valueOrNull!.path),
                          child: Image.file(
                            image.valueOrNull!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : PhotoWithUrl(
                          h: h,
                          w: w,
                          // url: (_prefs.user.avatar
                          //     //+'?v=${DateTime.now().millisecondsSinceEpoch}'
                          //
                          //     )
                        ))),
        );
      },
    );
  }
}
