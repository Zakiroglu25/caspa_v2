import 'package:cached_network_image/cached_network_image.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/user_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/cubits/user/user_cubit.dart';
import '../../../../locator.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/screen/alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/custom/buttons/caspa_button.dart';

class ProfilePhoto extends StatelessWidget {
  final double? w;
  final double? h;
  final bool? editable;

  ProfilePhoto({this.w, this.h, this.editable = false});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => Alert.body(context,
          buttonText: MyText.gallery,
          textAlign: TextAlign.center,
          title: MyText.youMustSelectOneOfThem,
          image: MySizedBox.h16,
          onTap: () => context.read<UserCubit>().checkAndPickImage(context),
          secondButton: CaspaButton(
            onTap: () {
              Go.pop(context);
              context.read<UserCubit>().checkAndTake(context);
            },
            text: MyText.camera,
          )),
      child: Stack(
        children: [
          UserPhoto(
            editOnTap: editable!,
          ),
          Positioned(
            bottom: 0,
            right: 2,
            child: WidgetOrEmpty(
                value: (editable ?? false),
                child: Container(
                    height: 36.sm,
                    width: 36.sm,
                    decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(36.sm)),
                    padding: Paddings.paddingA4,
                    child: Center(
                      child: Container(
                          height: 20.sm,
                          width: 20.sm,
                          child: SvgPicture.asset(Assets.svgCamera)),
                    ))),
          )
        ],
      ),
    );
  }
}
