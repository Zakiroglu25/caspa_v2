import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
            textTheme: GoogleFonts.sairaTextTheme(
            //  Theme.of(context).textTheme,
            ),
            primarySwatch: Colors.orange,
          ),
        builder: (context, widget) {
          return ScrollConfiguration(
              behavior: ScrollBehaviorModified(), child: widget!);
        },
          home:
              //MediaPage()
              SplashPage(),
          //LoginPage()
        // LandingPage()
        //    HomePage()
          // HomePage()
          //CupertinoStoreHomePage()
          //CircularHomePage()
          ),
    );
  }
}
//