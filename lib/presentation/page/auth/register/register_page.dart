import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../infrastructure/cubits/register/register_cubit.dart';
import '../../../../util/enums/register_type.dart';
import 'widgets/tabs/business_register_tab.dart';
import 'widgets/tabs/civil_register_tab.dart';

class RegisterPage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    CivilRegisterTab(),
    BusinessRegisterTab(),
  ];

  final List<Widget> tabs = const [
    Tab(
      text: MyText.civilRegistration,
      height: 55,
    ),
    Tab(
      text: MyText.businessRegistration,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SliverCaspaBar(
        appbarHeight: 1,
        tabs: tabs,
        notification: false,
        back: true,
        tabbarPadding: Paddings.paddingH16 + Paddings.paddingV4,
        tabPages: tabPages,
        selectedLabelColor: MyColors.white,
        selectedTabColor: MyColors.mainColor,
        tabController: (index) =>
            context.read<RegisterCubit>().updateRegisterType = index,
        title: MyText.registration,
        sliverChild: Container(),
      ),
    ));
  }
}
