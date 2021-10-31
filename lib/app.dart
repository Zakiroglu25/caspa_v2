import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/page/auth/login_page/login_page.dart';
import 'presentation/page/landing_page/landing_page.dart';
import 'presentation/page/splash_page/splash_page.dart';
import 'util/delegate/scroll_behaivor.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // textTheme: GoogleFonts.sairaTextTheme(
            // //  Theme.of(context).textTheme,
            // ),
            fontFamily: 'CoHeadline',
            primarySwatch: Colors.orange,
          ),
        builder: (context, widget) {
          return ScrollConfiguration(
              behavior: ScrollBehaviorModified(), child: widget!);
        },
          home:
              //MediaPage()
             // SplashPage(),
       // RegisterPage(),
        // LoginPage(),
       LandingPage()
        //    HomePage()
          // HomePage()
          // LoginPage()
        //SplashPage()
          //CupertinoStoreHomePage()
          //CircularHomePage()
          ),
    );
  }
}
//