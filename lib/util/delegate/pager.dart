// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/address/address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/courier_orders_page.dart';
import 'package:caspa_v2/presentation/page/declare_page/declare_tab.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tariff_details.dart';
import 'package:caspa_v2/presentation/page/kuryer_page/kuryer_page.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/presentation/page/new_order_link_page/link_tab.dart';
import 'package:caspa_v2/presentation/page/new_order_page/new_order_page.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/new_order_payment_page.dart';
import 'package:caspa_v2/presentation/page/notifications_page/notifications_page.dart';
import 'package:caspa_v2/presentation/page/onboard_page/onboard_page.dart';
import 'package:caspa_v2/presentation/page/order_success_page/order_success_page.dart';
import 'package:caspa_v2/presentation/page/other_page/other_page.dart';
import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';
import 'package:caspa_v2/presentation/page/shops_page/shops_page.dart';
import 'package:caspa_v2/presentation/page/splash_page/splash_page.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/user_cabinet_page.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/user_settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';

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
          value: CourierCubit(),
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

  static get newOrder => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: NewOrderPage());

  static get viaLink => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: LinkPage());

  static get userSettingsPage => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: UserSettingsPage());

  static get notifications => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: NotificationsPage());

  static get promocode => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: PromoCodePage());

  static get contact => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: ContactPage());

  static get other => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => UserCubit()),
        //    BlocProvider.value(value: AuthenticationCubit()),
      ], child: OtherPage());

  static get newOrderPayment => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: NewOrderPaymentPage());

  static get onBoard => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: OnboardPage());

  static get declare => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: DeclarePage());

  static get landing => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: LandingPage());

  static get userCabinet => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: UserCabinetPage());

  static get adress => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: AddressCubit()..fetch(),
        )
      ], child: AdressPage());

  static get shops => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ShopCubit()..fetch(),
        )
      ], child: ShopPage());

  static get app => BlocProvider(
      create: (context) =>
          AuthenticationCubit()..startApp(context, showSplash: true),
      child: App());

static get tarifDetails => BlocProvider(
    create: (context) =>
    TarifCubit()..fetch(),
    child: TariffDetails(hList: [],));
}
