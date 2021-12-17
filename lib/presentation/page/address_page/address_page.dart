import 'package:caspa_v2/infrastructure/cubits/address/address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/address/address_state.dart';
import 'package:caspa_v2/presentation/page/address_page/widget/adress_sliver_body.dart';
import 'package:caspa_v2/util/constants/app_text_styles.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/no_data_widget.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/turkey_anbar.dart';

class AdressPage extends StatelessWidget {
  final List<Widget> tabPages = <Widget>[
    //TurkeyAnbar(),
    Text('second'),
    Text('third')
  ];

  final List<Widget> tabs = const [
    Tab(
      text: 'Türkiyə',
      height: 60,
    ),
    Tab(
      text: 'Amerika',
    ),
    Tab(
      text: 'Çin',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: SafeArea(
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressSuccess) {
            // final a=state.data[0];
            // a.name='America';
            //
            // final b=state.data[0];
            // a.name='Finland';
            //
            // final c=state.data[0];
            // a.name='Holland';
            //
            // final d=state.data[0];
            // a.name='Russia';
            //
            //
            // state.data.add(a);
            // state.data.add(b);

            //state.data.add(e);

            return SliverCaspaBar(
              appbarHeight: 265,
              tabs: state.data
                  .map((adress) => Tab(
                        text: adress.name,
                        height: 60,
                      ))
                  .toList(),
              tabPages: state.data.map((adress) => TurkeyAnbar(adress)).toList(),
              title: MyText.adresses,
              sliverChild: AdressSliverAppbarBody(),
            );
          } else if (state is AddressInProgress) {
            return CaspaLoading();
          } else if (state is AddressError) {
            return EmptyWidget(
              text: state.error,
            );
          } else
            return EmptyWidget();
        },
      ),
    ));
  }
}

