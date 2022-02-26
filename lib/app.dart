import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_state.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/page/splash_page/splash_page.dart';
import 'util/delegate/pager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationSplash) {
        return SplashPage();
      } else if (state is AuthenticationLoading) {
        return Scaffold(
          body: CaspaLoading(),
        );
      } else if (state is AuthenticationServerError) {
        return SafeArea(
          child: Scaffold(
              body: EmptyWidget(
            text: "server_error",
            // refreshButton: () =>
            //   context.read<AuthenticationCubit>()
            //     ..startApp(context, showSplash: false),
          )),
        );
      }
      if (state is AuthenticationUninitialized) {
        return Pager.login;
      } else if (state is AuthenticationOnboarding) {

        return Pager.onBoard;
      } else if (state is AuthenticationAuthenticated) {
        return Pager.landing;
      } else {
        return Pager.login;

      }
    });
  }
}
