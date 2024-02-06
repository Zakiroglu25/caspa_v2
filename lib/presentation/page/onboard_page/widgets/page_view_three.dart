import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/custom/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'moto_image.dart';

class PageViewThree extends StatelessWidget {
  const PageViewThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingA16,
      child: Column(
        children: [
          MotoImage(),
          Spacer(),
          MySizedBox.h16,
          Center(
            child: Text(
              "Kuryer xidmətini də bizdən sifariş edin!",
              style: AppTextStyles.coHead400.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                height: 1.1,
                color: MyColors.black34,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          MySizedBox.h16,
          Text(
            "Pozitivlik qəlbimizdədir! Bunu yaymağı hədəfləyirik.",
            maxLines: 4,
            textAlign: TextAlign.center,
            style: AppTextStyles.sanF400,
          ),
          const Spacer(
            flex: 3,
          ),
          AppButton(
            text: MyText.start,
            onTap: () {
              context.read<AuthenticationCubit>().onBoardHaveSeen(context);
              // return Go.to(context, Pager.login);
            },
          ),
        ],
      ),
    );
  }
}
