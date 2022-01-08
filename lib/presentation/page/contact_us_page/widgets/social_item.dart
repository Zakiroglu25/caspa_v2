import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialItem extends StatelessWidget {
  final String? name;
  final String? content;
  final String? path;
  final Function? onTap;

  SocialItem(
      {required this.name,
      required this.path,
      required this.onTap,
      this.content});

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => bbbb("a"),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.sm,
            backgroundColor: Color.fromRGBO(85, 169, 50, 0.1),
            child: SvgPicture.asset(path!),
          ),
          MySizedBox.w12,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: AppTextStyles.sanF600.copyWith(fontSize: 14.sm),
              ),
              WidgetOrEmpty(
                value: content != null,
                child: Container(
                  margin: Paddings.paddingT4,
                  child: Text(
                    content ?? "",
                    style: AppTextStyles.sanF400.copyWith(fontSize: 12.sm),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
