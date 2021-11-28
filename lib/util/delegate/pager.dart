// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/courier_orders_page.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/kuryer_page/kuryer_page.dart';
import 'package:caspa_v2/presentation/page/order_success_page/order_success_page.dart';
import 'package:caspa_v2/presentation/page/splash_page/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pager {
  static get home => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        )
      ], child: HomePage());

  static get courier_order => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        )
      ], child: CourierOrdersPage());

  static get order_success => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        )
      ], child: OrderSuccessPage());

  static get courier => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        )
      ], child: KuryerPage());

  static get login => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginCubit())],
      child: LoginPage());

  static get register => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => RegisterCubit())],
      child: RegisterPage());

  static get forgotPass => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: ForgetPasswordPage());

  static get splash => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: SplashPage());
}
