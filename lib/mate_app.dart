import 'package:bot_toast/bot_toast.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'infrastructure/cubits/authentication/authentication_cubit.dart';
import 'util/constants/colors.dart';
import 'util/constants/text.dart';
import 'util/delegate/scroll_behaivor.dart';
import 'package:animations/animations.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => BlocProvider(
              create: (context) =>
                  AuthenticationCubit()..startApp(context, showSplash: true),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: MyText.messenger,

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
                          TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                            transitionType: SharedAxisTransitionType.scaled,
                          ),
                        },
                      ),
                      fontFamily: 'CoHeadline',
                      scaffoldBackgroundColor: MyColors.white),
                  builder: (context, widget) {
                    BotToastInit().call(context,widget);
                    return ScrollConfiguration(
                        behavior: ScrollBehaviorModified(), child: widget!);
                  },
                  home:
                      //Pager.newOrder
                      // Pager.shops,
                      // Pager.report
                      // Pager.payment
                      Pager.app()),
            ));
  }
}
