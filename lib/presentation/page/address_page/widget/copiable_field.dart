import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopiableField extends StatelessWidget {
  String? title;
  String? data;
  String? copyText;
  int? maxLines = 1;

  CopiableField(
      {@required this.title,
      @required this.data,
      this.copyText,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox.h8,
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: data ?? "")).then((_) {
                Snack.display(
                    context: context,
                    message: copyText ?? "coppied",
                    showSuccessIcon: true,
                    positive: true);
              });
            },
            child: Container(
              //height: 72 + (((maxLines ?? 1) - 1) * 20.0),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title ?? "",
                          style: const TextStyle(
                              color: MyColors.textBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        MySizedBox.h2,
                        Text(
                          data ?? "",
                          //  overflow: TextOverflow.ellipsis,
                          //maxLines: maxLines ?? 1,
                          style: TextStyle(
                              color: MyColors.textFieldLittleText,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  MySizedBox.w10,
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        Assets.svgCopy,
                        color: MyColors.textBlack,
                      ))
                ],
              ),
              decoration: BoxDecoration(
                  color: MyColors.mainGrey,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
