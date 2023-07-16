import 'package:animations/animations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:caspa_v2/infrastructure/configs/base.dart';
import 'package:caspa_v2/infrastructure/services/navigation_service.dart';
import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'infrastructure/cubits/authentication/authentication_cubit.dart';
import 'infrastructure/provider/close_provider.dart';
import 'util/constants/colors.dart';
import 'util/delegate/scroll_behaivor.dart';

class MateApp extends StatelessWidget {
  const  MateApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => ChangeNotifierProvider(
              create: (context) => CloseProvider(),
              child: BlocProvider(
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
                        pageTransitionsTheme: const PageTransitionsTheme(
                          builders: <TargetPlatform, PageTransitionsBuilder>{
                            TargetPlatform.android:
                                SharedAxisPageTransitionsBuilder(
                              transitionType: SharedAxisTransitionType.scaled,
                            ),
                            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
                                //transitionType: SharedAxisTransitionType.,
                                )
                            // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(
                            //  // transitionType: SharedAxisTransitionType.scaled,
                            // ),
                          },
                        ),
                        fontFamily: 'CoHeadline',
                        scaffoldBackgroundColor: MyColors.white),
                    builder: (context, widget) {
                      // ScreenUtil.setContext(context);
                      widget = BotToastInit().call(context, widget);
                      //  widgets = botToastBuilder(context,widgets);
                      return ScrollConfiguration(
                          behavior: ScrollBehaviorModified(), child: widget);
                    },
                    home: Builder(builder: (context) {
                      return WillPopScope(
                        onWillPop: () async {
                          return await Provider.of<CloseProvider>(context,
                                  listen: false)
                              .clickBack();
                        },
                        child: Pager.app(),
                      );
                    })),
              ),
            ));
  }
}
