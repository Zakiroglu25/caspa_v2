// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/presentation/page/courier_orders_page/courier_orders_page.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:caspa_v2/presentation/page/order_success_page/order_success_page.dart';
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

}
