import 'dart:math';

import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/presentation/page/package_details_page/widget/info_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'presentation/page/auth/forget_password/forget_pass_page.dart';
import 'presentation/page/auth/login_page/login_page.dart';
import 'presentation/page/home_page/home_page.dart';
import 'presentation/page/landing_page/landing_page.dart';
import 'presentation/page/splash_page/splash_page.dart';
import 'util/delegate/scroll_behaivor.dart';

import 'package:transparent_image/transparent_image.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
          color: Colors.orange,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              fontFamily: 'CoHeadline',
              scaffoldBackgroundColor: MyColors.white),
          builder: (context, widget) {
            return ScrollConfiguration(
                behavior: ScrollBehaviorModified(), child: widget!);
          },
          home:
              //MediaPage()
               //SplashPage(),
              // RegisterPage(),
              // LoginPage(),
             PackageDetailsPage(name: "Kitabacanan",)
         // Example08()
           // HomePage()
          //  BlocProvider(
          //
          //
          // create: (context) => ForgotPassCubit(),
          //  child: ForgetPasswordPage())
//          SilverAppBarExample(),
          // BlocProvider(
          // create: (context)=>LoginCubit()
          // ,child: LoginPage())
          //SplashPage()
          //CupertinoStoreHomePage()
          //CircularHomePage()
          ),
    );
  }
}
//


class Example08 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('random dynamic tile sizes'),
      ),
      body: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) => Container(
          height: 100*(index%2)+20,
          color: Colors.orange,

        ),
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}


