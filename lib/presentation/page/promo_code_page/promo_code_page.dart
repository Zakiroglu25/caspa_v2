import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_state.dart';
import 'package:caspa_v2/presentation/page/promo_code_page/widgets/promo_code_field.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/custom/buttons/caspa_button.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/promo_code_apply_button.dart';
import 'widgets/promo_codes_list.dart';

class PromoCodePage extends StatelessWidget {
  const PromoCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: MyText.promoCodeX,
        notification: false,
      ),
      body: ListView(
        padding: Paddings.paddingH16 + Paddings.paddingB24,
        children: [
          ColorfullBackImage(
            path: Assets.pngRocket,
            infoTitle: MyText.littlePromo,
            infoContent: MyText.infoPromo,
          ),
          MySizedBox.h16,
          PromoCodeField(),
          PromoCodeApplyButton(),
          MySizedBox.h40,
          PromoCodesList()
        ],
      ),
    );
  }
}
