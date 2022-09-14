import 'package:caspa_v2/infrastructure/cubits/shop/shop_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/shop/shop_state.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/shop_list.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        contextA: context,
        title: MyText.stores,
        user: false,
      ),
      body: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          if (state is ShopSuccess) {
            final shopList = state.shopList;
            return ShopListView(shopList);
          } else if (state is ShopInProgress) {
            return CaspaLoading();
          } else if (state is ShopError) {
            return EmptyWidget(text: "Magazalar tapılmadı");
          } else
            return EmptyWidget();
        },
      ),
    );
  }
}
