import 'package:caspa_v2/infrastructure/cubits/address/address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/address/address_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/address_model.dart';
import 'package:caspa_v2/presentation/page/address_page/widget/adress_sliver_body.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:caspa_v2/widget/general/list_or_empty.dart';
import 'package:caspa_v2/widget/main/sliver_caspa_bar/sliver_caspa_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/turkey_anbar.dart';

class AdressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressSuccess) {
            final adressList = state.adress;
            return ListOrEmpty(
                list: adressList,
                child: SliverCaspaBar(
                  appbarHeight: 1,
                  tabs: tabs(adressList),
                  tabPages: tabPages(adressList),
                  title: MyText.adresses,
                  sliverChild: AdressSliverAppbarBody(),
                ));
          } else if (state is AddressInProgress) {
            return CaspaLoading();
          } else if (state is AddressError) {
            return EmptyWidget();
          } else
            return EmptyWidget();
        },
      ),
    ));
  }

  List<TurkeyAnbar> tabPages(List<Adress> adressList) =>
      adressList.map((adress) => TurkeyAnbar(adress)).toList();

  List<Tab> tabs(List<Adress> adressList) {
    return adressList
        .map((adress) => Tab(
              text: adress.name,
              height: 60,
            ))
        .toList();
  }
}
