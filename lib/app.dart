import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_state.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/page/splash_page/splash_page.dart';
import 'util/constants/colors.dart';
import 'util/delegate/pager.dart';
import 'widget/general/no_data_widget.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      eeee(state.toString());
      if (state is AuthenticationSplash) {
        return SplashPage();
      } else if (state is AuthenticationLoading) {
        return Scaffold(
          backgroundColor: MyColors.backMainColor,
          body: CaspaLoading(),
        );
      } else if (state is AuthenticationServerError) {
        return SafeArea(
          child: Scaffold(
              body: NoData(
            text: "server_error",
            refreshButton: () {
              context.read<AuthenticationCubit>()
                ..startApp(context, showSplash: false);
            },
          )),
        );
      }


      if (state is AuthenticationUninitialized) {
        return Pager.login;
      } else {
        return Pager.landing;
      }
    });
  }
}
