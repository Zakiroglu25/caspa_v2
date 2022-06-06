import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/infrastructure/services/hive_service.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../infrastructure/cubits/contact/contact_cubit.dart';
import '../../../../infrastructure/cubits/contact/contact_state.dart';
import '../../../../infrastructure/models/remote/response/contact_model.dart';
import '../../../../locator.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../widget/custom/fab/fab_animation.dart';
import 'copiable_field.dart';

class TurkeyAnbar extends StatelessWidget {
  HiveService get _prefs => locator<HiveService>();
  Adress adress;

  TurkeyAnbar(this.adress);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      //behavior: NoScrollBehavior(),
      child: Stack(
        children: [
          ListView(
            controller: _scrollController,
            physics: Physics.alwaysBounce,
            padding: Paddings.paddingH20,
            shrinkWrap: true,
            children: [
              CopiableField(
                title: "İsim",
                data: _prefs.user.name,
              ),
              CopiableField(
                title: "Soyisim",
                data: _prefs.user.surname,
              ),
              CopiableField(
                title: "İlçe",
                data: adress.fields?.ilce,
              ),
              CopiableField(
                title: "Adres satır 1",
                data: "${adress.address} ${_prefs.user.username}",
              ),
              CopiableField(
                title: "İl:",
                data: "${adress.fields?.il}",
              ),
              CopiableField(
                title: "Mahalle",
                data: "${adress.fields?.mahalle}",
              ),
              CopiableField(
                title: "Telefon",
                data: "${adress.fields?.telefon}",
              ),
              CopiableField(
                title: "Tc kimlik",
                data: "${adress.fields?.tcKimlik}",
              ),
              CopiableField(
                title: "Posta Kodu",
                data: "${adress.fields?.postaKodu}",
              ),
              CopiableField(
                //  maxLines: 1,
                title: "Adres Başlığı",
                data: "${adress.fields?.adresBashligi}",
              ),
              MySizedBox.h80
            ],
          ),
          BlocProvider(
            create: (context) => ContactCubit()..fetch(),
            child: BlocBuilder<ContactCubit, ContactState>(
              builder: (context, state) {
                if (state is ContactSuccess) {
                  final Contacts contact = state.contact;
                  return Positioned(
                    bottom: 16,
                    right: 16,
                    child: ScrollingFabAnimation(
                      width: 129,
                      height: 56,
                      radius: 100,
                      color: MyColors.wpColor,
                      icon: SvgPicture.asset(Assets.svgMiniWhatsapp),
                      scrollController: _scrollController,
                      text: Text(
                        'Whatsapp',
                        style: AppTextStyles.sanF500
                            .copyWith(color: MyColors.white, fontSize: 14.sp),
                      ),
                      onPress: () =>
                          launchUrlString(
                              'https://api.whatsapp.com/send?phone=${contact
                                  .whatsapp}'),
                      inverted: false,
                      animateIcon: false,
                      elevation: 0,
                      // onPress: () {  },
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
