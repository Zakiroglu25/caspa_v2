import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/size_config.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'moto_image.dart';

class PageViewThree extends StatelessWidget {
  const PageViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MotoImage(),
        Spacer(),
        const Center(
          child: Text(
            "Kuryer xidmətini də bizdən sifariş edin",
            style: TextStyle(
              fontFamily: "CoHeadline",
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: MyColors.mainBlue2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            "Pozitivlik qəlbimizdədir! Bunu yaymağı hədəfləyirik.",
            maxLines: 4,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.splashLittleText,
                fontSize: 14,
                fontFamily: "San Francisco"),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: CaspaButton(
            text: MyText.start,
            onTap: () => Go.to(context, Pager.login),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
