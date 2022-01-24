// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/address/address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/attorneys/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/category/category_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/contact/contact_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/payment/payment_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/add_or_edit_attorney_page/add_or_edit_etibarname_page.dart';
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/courier_orders_page.dart';
import 'package:caspa_v2/presentation/page/courier_page/courier_page.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/etibarname_page.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';
import 'package:caspa_v2/presentation/page/license_page/license_page.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/tabs/package_history_tab.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/tabs/waiting_package_tab.dart';
import 'package:caspa_v2/presentation/page/report_page/report_page.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/home_page/widgets/tariff_details.dart';
import 'package:caspa_v2/presentation/page/landing_page/landing_page.dart';
import 'package:caspa_v2/presentation/page/order_via_link_page/order_via_link_page.dart';
import 'package:caspa_v2/presentation/page/new_order_page/new_order_page.dart';
import 'package:caspa_v2/presentation/page/new_order_payment_page/new_order_payment_page.dart';
import 'package:caspa_v2/presentation/page/notifications_page/notifications_page.dart';
import 'package:caspa_v2/presentation/page/onboard_page/onboard_page.dart';
import 'package:caspa_v2/presentation/page/settings_page/app_info_page.dart';
import 'package:caspa_v2/presentation/page/settings_page/settings_page.dart';
import 'package:caspa_v2/presentation/page/success_page/success_page.dart';
import 'package:caspa_v2/presentation/page/other_page/other_page.dart';
import 'package:caspa_v2/presentation/page/promo_code_page/promo_code_page.dart';
import 'package:caspa_v2/presentation/page/shops_page/shops_page.dart';
import 'package:caspa_v2/presentation/page/splash_page/splash_page.dart';
import 'package:caspa_v2/presentation/page/user_cabinet_page/user_cabinet_page.dart';
import 'package:caspa_v2/presentation/page/user_settings_page/user_settings_page.dart';
import 'package:flutter/material.dart';
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

  static success({
    bool? showSplash,
    String? infoContent,
    String? infoTitle,
    Widget? againPage,
  }) =>
      MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: TarifCubit()..fetch(),
            )
          ],
          child: SuccessPage(
            infoTitle: infoTitle,
            infoContent: infoContent,
            againPage: againPage,
          ));

  static get courier => MultiBlocProvider(providers: [
    BlocProvider.value(
      value: CourierCubit()..fetchPackagesForCourier(),
    )
  ], child: CourierPage());

  static get login => MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginCubit()),
    // BlocProvider(create: (context) => AuthenticationCubit())
  ], child: LoginPage());

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
      providers: [BlocProvider(create: (context) => OrderViaUrlCubit())],
      child: OrderViaLinkPage());

  static get userSettingsPage => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: UserSettingsPage());

  static get notifications => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: NotificationsPage());

  static get promoCode => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PromoCodeCubit()..fetch())],
      child: PromoCodePage());

  static get giftBalance => MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GiftBalanceCubit()..fetch())
  ], child: GiftBalancePage());

  static get contact => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserCubit(),
      ),
      BlocProvider(
        create: (context) => ContactCubit()..fetch(),
      ),
    ],
    child: ContactPage(),
  );

  static get other => MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserCubit()),
    //    BlocProvider.value(value: AuthenticationCubit()),
  ], child: OtherPage());

  static get payment => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PaymentCubit())],
      child: PaymentPage());

  static get onBoard => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: OnboardPage());

  static get report => MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ReportCubit()),
    BlocProvider(create: (context) => CategoryCubit()),
  ], child: ReportPage());

  static get landing => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: LandingPage());

  static get attorney => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: EtibarnamePage());

  static get appInfo => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: AppInfoPage());

  static get license => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: LicensePageX());

  static get settings => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: SettingsPage());

  static get userCabinet => MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserCubit()),
    // BlocProvider.value(
    //   value: AuthenticationCubit(),
    // )
  ], child: UserCabinetPage());

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

  // static get app => App();

  // static get app => BlocProvider(
  //     create: (context) =>
  //         AuthenticationCubit()..startApp(context, showSplash: true),
  //     child: App());

  static app({bool? showSplash}) => BlocProvider(
      create: (context) => AuthenticationCubit()
        ..startApp(context, showSplash: showSplash ?? true),
      child: App());

  static get tarifDetails => BlocProvider(
      create: (context) => TarifCubit()..fetch(),
      child: TariffDetails(
        hList: [],
      ));

  static Widget waitingPackages({required List<Package>? packages}) =>
      BlocProvider(
          create: (context) => PackageCubit()..fetch(),
          child: WaitingPackageTab(
            packages: packages,
          ));

  static get packagesHistory => BlocProvider(
      create: (context) => PackageCubit()..fetch(), child: PackageHistoryTab());

  static packageDetails({required Package package}) => BlocProvider(
      create: (context) => PackageCubit(),
      child: PackageDetailsPage(
        package: package,
      ));

  static addOrEditAttorney({Attorney? attorney}) => BlocProvider(
      create: (context) => AddAttorneysCubit(),
      child: AddOrEditEtibarnamePage(
        attorney: attorney,
      ));
}