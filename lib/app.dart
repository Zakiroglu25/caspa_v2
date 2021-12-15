
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'util/delegate/pager.dart';
import 'util/delegate/scroll_behaivor.dart';

class App extends StatelessWidget {
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

        //LandingPage(),
         //Pager.promocode
        //PackagePage(),
          // Pager.newOrder
          //Kam*77
          //k.mamtiyev
          //  BlocProvider(
          // create: (context) => ForgotPassCubit(),
          //  child: ForgetPasswordPage())
          //SilverAppBarExample(),
       // Pager.login
          //  BlocProvider(
          //  create: (context)=>LoginCubit()
          //  ,child: LoginPage())
          //SplashPage()
          //CupertinoStoreHomePage()
          //CircularHomePage()
          ),
    );
  }
}
//


              //Pager.newOrderPayment),

    );
  }
}

