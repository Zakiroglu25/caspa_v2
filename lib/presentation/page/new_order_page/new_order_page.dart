import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/screen/ink_wrapper.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/color_fully_back_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../infrastructure/cubits/contact/contact_cubit.dart';
import '../../../infrastructure/cubits/contact/contact_state.dart';
import '../../../infrastructure/models/remote/response/contact_model.dart';
import '../../../util/constants/app_text_styles.dart';
import '../../../util/constants/colors.dart';
import 'widgets/via_link_and_beyan_et_buttons.dart';

class NewOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
      ),
      body: Stack(
        children: [
          ListView(
            padding: Paddings.paddingH16 + Paddings.paddingT14,
            children: <Widget>[
              ColorfullBackImage(
                path: Assets.pngSebet,
                title: MyText.newOrder,
              ),
              ViaLinkAndBeyanEtButtons()
            ],
          ),
          BlocProvider(
            create: (context) => ContactCubit()..fetch(),
            child: BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
                if (state is ContactSuccess) {
                  final Contacts contact = state.contact;
                  return Positioned(
                    bottom: 60,
                    right: 16,
                    child: InkWrapper(
                      onTap: () =>
                          launchUrlString(
                              'https://api.whatsapp.com/send?phone=${contact
                                  .whatsapp}'),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: MyColors.wpColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: SvgPicture.asset(Assets.svgMiniWhatsapp)),
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
