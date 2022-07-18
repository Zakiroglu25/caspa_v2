import 'package:caspa_v2/presentation/page/home_page/widgets/section_name.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/delegate/navigate_utils.dart';
import '../../../../util/screen/ink_wrapper.dart';
import '../../../../widget/custom/buttons/null_icon_button.dart';

class AddNewAdressButton extends StatelessWidget {
  const AddNewAdressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWrapper(
        onTap: () {
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   builder: (context) => Container(),
          // );
          showCupertinoModalBottomSheet(
            expand: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => Material(
                child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(Assets.svgClose),
                        ),
                        onPressed: () => Go.pop(context),
                      ),
                      Text(
                        MyText.addNewAdress,
                        style: AppTextStyles.sanF400.copyWith(fontSize: 18),
                      ),
                      NullIconButton(),
                      //  MySizedBox.w12
                    ],
                  ),
                  ListView(
                    padding: Paddings.paddingA16 + Paddings.paddingT8,
                    shrinkWrap: true,
                    children: [
                      SectionName(title: MyText.delivery_adress),
                      CaspaField(),
                      CaspaField(),
                      CaspaField(),
                    ],
                  ),
                ],
              ),
            )),
          );
          bbbb("salaaaam");
        },
        child: Container(
            width: 165,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.mainOpacity),
            child: Center(
              child: Text(
                MyText.addNewAdressX,
                style:
                    AppTextStyles.sanF500.copyWith(color: MyColors.mainColor),
              ),
            )),
      ),
    );
  }
}
