// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/add_attorneys/add_attorneys_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/address/address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/ads_cubit/ads_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/authentication/authentication_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/category/category_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/commission/comission_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/contact/contact_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/courier/courier_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/forgot_pass/forgot_pass_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/get_attorneys/attorney_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/gift_balance/gift_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/login/login_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/notification/notification_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url_list/order_via_url_list_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_statuses/package_statuses_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/packages/packages_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/payment_balance/payment_balance_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/promo_code/promo_code_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/register/register_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/user/user_cubit.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/attorney_list_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/add_balane_page/add_balance_page.dart';
import 'package:caspa_v2/presentation/page/add_or_edit_attorney_page/add_or_edit_etibarname_page.dart';
import 'package:caspa_v2/presentation/page/address_page/address_page.dart';
import 'package:caspa_v2/presentation/page/auth/forget_password/forget_pass_page.dart';
import 'package:caspa_v2/presentation/page/auth/login_page/login_page.dart';
import 'package:caspa_v2/presentation/page/auth/register/register_page.dart';
import 'package:caspa_v2/presentation/page/contact_us_page/contact_us_page.dart';
import 'package:caspa_v2/presentation/page/courier_list_page/courier_list_page.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/courier_orders_page.dart';
import 'package:caspa_v2/presentation/page/courier_page/courier_page.dart';
import 'package:caspa_v2/presentation/page/etibarname_page/etibarname_page.dart';
import 'package:caspa_v2/presentation/page/gift_balance_page/gift_balance_page.dart';
import 'package:caspa_v2/presentation/page/order_via_link_list_page/order_via_link_list_page.dart';
import 'package:caspa_v2/presentation/page/package_details_page/package_details_page.dart';
import 'package:caspa_v2/presentation/page/package_page/package_page.dart';
import 'package:caspa_v2/presentation/page/package_page/widget/packages_list.dart';
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
import 'package:caspa_v2/presentation/page/webview_page/webview_page.dart';
import 'package:caspa_v2/util/enums/payment_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../../infrastructure/cubits/courier/courier_list_cubit/courier_list_cubit.dart';
import '../../infrastructure/cubits/notification_list/notification_list_cubit.dart';
import '../../infrastructure/cubits/sms_codes/sms_codes_cubit.dart';
import '../../infrastructure/models/remote/response/regions_model.dart';
import '../../presentation/page/any_info_page/any_info_page.dart';
import '../../presentation/page/sms_codes_page/sms_codes_page.dart';
import '../../infrastructure/cubits/calculate/calculate_capacity/calculate_capacity_cubit.dart';
import '../../infrastructure/cubits/calculate/calculate_cubit.dart';
import '../../infrastructure/models/remote/response/regions_model.dart';
import '../../presentation/page/calculate_page/calculate_page.dart';

class Pager {
  static get home => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        ),
        BlocProvider.value(
          value: AdsCubit()..fetch(),
        )
      ], child: HomePage());

  static get package => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: PackageStatusesCubit()..fetch(),
        )
      ], child: const PackagePage());

  static get newOrder => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: PackageStatusesCubit()..fetch(),
        )
      ], child: NewOrderPage());

  static webviewPage({required String url, required BuildContext context}) =>
      MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: PackageStatusesCubit(),
            )
          ],
          child: WebviewPage(
            url: url,
            mainContext: context,
            whenSuccess: () {},
          ));

  static courier_order({
    required List<Package> packages,
    required String phone,
    required String adress,
    required String price,
    required Region region,
  }) =>
      MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: CourierCubit(),
            ),
            //BlocProvider(create: (context) => CourierCubit()),
            BlocProvider(create: (context) => PackageDetailsCubit()),
          ],
          child: CourierOrdersPage(
              phone: phone,
              packages: packages,
              adress: adress,
              price: price,
              region: region));

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
      ], child: const LoginPage());

  static get smsCodes => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => SmsCodesCubit()..start()),
        // BlocProvider(create: (context) => AuthenticationCubit())
      ], child: const SmsCodesPage());

  static get register => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => RegisterCubit())],
      child: RegisterPage());

  static get forgotPass => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: const ForgetPasswordPage());

  static get splash => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: SplashPage());

  static orderViaLink({LinkOrder? order}) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => OrderViaUrlCubit()),
            BlocProvider(create: (context) => CommissionCubit()..fetch()),
          ],
          child: OrderViaLinkPage(
            order: order,
          ));

  static get orderViaLinkList => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => OrderViaUrlListCubit()..fetch()),
        BlocProvider(create: (context) => PackageDetailsCubit()),
      ], child: const OrderViaLinkListPage());

  static get userSettingsPage => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: const UserSettingsPage());

  static get notifications => MultiBlocProvider(providers: [
        BlocProvider(create: (c) => NotificationCubit()..fetch()),
        // BlocProvider(create: (con) => NotificationListCubit()..fetch()),
      ], child: NotificationsPage());

  static get promoCode => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PromoCodeCubit()..fetch())],
      child: const PromoCodePage());

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
        child: const ContactPage(),
      );

  static get other => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => UserCubit()),
        //    BlocProvider.value(value: AuthenticationCubit()),
      ], child: OtherPage());

  static payment({required String price}) => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PaymentBalanceCubit())],
      child: PaymentPage(
        price: price,
      ));

  static get onBoard => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: const OnboardPage());

  static report({Package? package}) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ReportCubit()),
            BlocProvider(create: (context) => CategoryCubit()),
          ],
          child: ReportPage(
            package: package,
          ));

  static get landing => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: const LandingPage());

  static get attorney => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: const EtibarnamePage());

  static get appInfo => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: const AppInfoPage());

  static anyInfo({required String text, required String title}) =>
      MultiBlocProvider(
          providers: [BlocProvider(create: (context) => AttorneyListCubit())],
          child: AnyInfoPageX(
            text: text,
            title: title,
          ));

  static get settings => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AttorneyListCubit())],
      child: const SettingsPage());

//  static get trendyolOtp => const TrendyolOtpPage();

  static get userCabinet => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => UserCubit()),
      ], child: const UserCabinetPage());

  static get adress => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: AddressCubit()..fetch(),
        )
      ], child: AdressPage());

  static get shops => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ShopCubit()..fetch(),
        )
      ], child: const ShopPage());

  static get courierList => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => CourierListCubit()..fetch(),
        )
      ], child: CourierListPage());

  static get calculate => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => CalculateKgCubit()),
        BlocProvider(create: (context) => CalculateCapacityCubit())
      ], child: CalculatePage());

  // static get app => App();

  // static get app => BlocProvider(
  //     create: (context) =>
  //         AuthenticationCubit()..startApp(context, showSplash: true),
  //     child: App());

  static app({bool? showSplash}) => BlocProvider(
      create: (context) => AuthenticationCubit()
        ..startApp(context, showSplash: showSplash ?? true),
      child: const App());

  static get tarifDetails => BlocProvider(
      create: (context) => TarifCubit()..fetch(),
      child: TariffDetails(
        hList: [],
      ));

  static Widget waitingPackages({required List<Package>? packages}) =>
      BlocProvider(
          create: (context) => PackageCubit()..fetch(),
          child: PackagesList(
            packages: packages,
          ));

  static packageDetails({required Package package}) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PackageCubit(),
          ),
          BlocProvider(
            create: (context) => ReportCubit(),
          ),
          BlocProvider(
            create: (context) => PackageDetailsCubit(),
          ),
        ],
        child: PackageDetailsPage(
          package: package,
        ),
      );

  static addOrEditAttorney({Attorney? attorney}) => BlocProvider(
      create: (context) => AddAttorneysCubit(),
      child: AddOrEditEtibarnamePage(
        attorney: attorney,
      ));

  static paymentPage({required PaymentBalanceType paymentBalanceType}) =>
      BlocProvider(
          create: (context) => PaymentBalanceCubit(),
          child: AddBalancePage(
            paymentBalance: paymentBalanceType,
          ));
}
