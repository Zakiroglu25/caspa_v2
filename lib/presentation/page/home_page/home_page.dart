import 'package:caspa_v2/infrastructure/cubits/contact/contact_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/contact/contact_state.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/assets.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/more_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../infrastructure/cubits/ads_cubit/ads_cubit.dart';
import '../../../infrastructure/cubits/tarif/tarif_cubit.dart';
import '../../../infrastructure/models/remote/response/contact_model.dart';
import '../../../widget/custom/fab/fab_animation.dart';
import 'widgets/home_header.dart';
import 'widgets/news_list_widget.dart';
import 'widgets/home_package_list.dart';
import 'widgets/section_name.dart';
import 'widgets/tariffs.dart';
import 'widgets/tariffs_courier.dart';

class HomePage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: "",
        contextA: context,
        // title: _prefs.user.name! + " " + _prefs.user.surname!,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              shrinkWrap: true,
              padding: Paddings.paddingB12 + Paddings.paddingT14,
              children: [
                HomeHeader(),
                MySizedBox.h36,
                SectionName(
                  title: "Yeniliklər və xəbərləri izləyin",
                  hP: 20,
                ),
                MySizedBox.h16,
                Ads(),
                MySizedBox.h36,
                SectionName(
                  title: MyText.activePackages,
                  hP: 20,
                ),
                MySizedBox.h16,
                BlocProvider(
                  create: (context) => PackageCubit()..fetchActive(),
                  child: HomePackageList(),
                ),
                MySizedBox.h36,
                SectionName(
                  title: MyText.recognizeTariffs,
                  hP: 20,
                  tile: MoreButton(
                    onTap: () => Go.to(context, Pager.tarifDetails),
                  ),
                ),
                MySizedBox.h10,
                Tariffs(),
                MySizedBox.h80,
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
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
                  onPress: () => launchUrlString(
                      'https://api.whatsapp.com/send?phone=997261453'),
                  inverted: false,
                  animateIcon: false,
                  elevation: 0,
                  // onPress: () {  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
