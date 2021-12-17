import 'package:caspa_v2/util/delegate/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'infrastructure/cubits/authentication/authentication_cubit.dart';
import 'util/constants/colors.dart';
import 'util/constants/text.dart';
import 'util/delegate/scroll_behaivor.dart';

class MateApp extends StatelessWidget {
  const MateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: MyText.messenger,
          theme: ThemeData(
              fontFamily: 'CoHeadline',
              scaffoldBackgroundColor: MyColors.white),
          builder: (context, widget) {
            return ScrollConfiguration(
                behavior: ScrollBehaviorModified(), child: widget!);
          },
          home:
              //Pager.newOrder


          Pager.stores,
          //Pager.app
      )
    );
  }
}
