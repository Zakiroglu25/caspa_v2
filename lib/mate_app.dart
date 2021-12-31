import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'infrastructure/cubits/authentication/authentication_cubit.dart';
import 'util/constants/colors.dart';
import 'util/constants/text.dart';
import 'util/delegate/scroll_behaivor.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () =>
            BlocProvider(
              create: (context) =>
              AuthenticationCubit()
                ..startApp(context, showSplash: true),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: MyText.messenger,
                 // navigatorObservers: [ if (Configs.enableSentry) SentryNavigatorObserver(),],
                  theme: ThemeData(
                      fontFamily: 'CoHeadline',
                      scaffoldBackgroundColor: MyColors.white),
                  builder: (context, widget) {
                    return ScrollConfiguration(
                        behavior: ScrollBehaviorModified(), child: widget!);
                  },
                  home:
                  //Pager.newOrder
                  // Pager.shops,
                 // Pager.report
                  Pager.newOrderPayment
                 //Pager.app()
              ),
            )
    );
  }
}
