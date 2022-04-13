import 'package:bot_toast/bot_toast.dart';
import 'package:caspa_v2/infrastructure/configs/base.dart';
import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'infrastructure/cubits/authentication/authentication_cubit.dart';
import 'test.dart';
import 'util/constants/colors.dart';
import 'util/constants/text.dart';
import 'util/delegate/scroll_behaivor.dart';
import 'package:animations/animations.dart';

import 'widget/general/caspa_field.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);
  //final botToastBuilder = BotToastInit(); //
  @override
  Widget build(BuildContext context) {
    //bbbb('runnnnning');
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => BlocProvider(
              create: (context) =>
                  AuthenticationCubit()..startApp(context, showSplash: true),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: Configs.appName,
                  navigatorKey: NavigationService.instance.navigationKey,
                  //1. call BotToastInit
                  navigatorObservers: [BotToastNavigatorObserver()],
                  // navigatorObservers: [ if (Configs.enableSentry) SentryNavigatorObserver(),],
                  theme: ThemeData(
                      pageTransitionsTheme: PageTransitionsTheme(
                        builders: <TargetPlatform, PageTransitionsBuilder>{
                          TargetPlatform.android:
                              SharedAxisPageTransitionsBuilder(
                            transitionType: SharedAxisTransitionType.scaled,
                          ),
                          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
                              //transitionType: SharedAxisTransitionType.,
                              ) // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
                          //  // transitionType: SharedAxisTransitionType.scaled,
                          // ),
                        },
                      ),
                      fontFamily: 'CoHeadline',
                      scaffoldBackgroundColor: MyColors.white),
                  builder: (context, widget) {
                    ScreenUtil.setContext(context);
                    widget = BotToastInit().call(context, widget);
                    //  widget = botToastBuilder(context,widget);
                    return ScrollConfiguration(
                        behavior: ScrollBehaviorModified(), child: widget);
                  },
                  home:
                      //Pager.newOrder
                      // Pager.shops,
                      // Pager.report
                      // Pager.payment_balance
                      Builder(
                    builder: (ctx) {
                      return MyLApp();
                    },
                  )),
            ));
  }
}
