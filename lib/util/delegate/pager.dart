// Flutter imports:
import 'package:caspa_v2/infrastructure/cubits/tarif/tarif_cubit.dart';
import 'package:caspa_v2/presentation/page/home_page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pager {
  static get home => MultiBlocProvider(providers: [
        BlocProvider.value(
          value: TarifCubit()..fetch(),
        )
      ], child: HomePage());

}
