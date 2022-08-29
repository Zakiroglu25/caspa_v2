import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/link_order_model.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/alert.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/order_via_link_listview.dart';

class OrderViaLinkPage extends StatelessWidget {
  LinkOrder? order;

  OrderViaLinkPage({this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        title: MyText.newOrder,
        user: false,
        contextA: context,
      ),
      body: BlocListener<OrderViaUrlCubit, OrderViaUrlState>(
        listener: (context, state) {
          if (state is OrderViaUrlSuccess) {
            Go.pop(context);
            Alert.show(context,
                title: MyText.operationIsSuccess,
                content: MyText.infoOrderViaLink);
          }
          if (state is OrderViaUrlEdited) {
            Go.pop(context);
            Alert.show(context,
                title: MyText.operationIsSuccess,
                content: MyText.infoOrderViaLink);
          } else if (state is OrderViaUrlError) {
            Snack.display(
                context: context, message: state.error ?? MyText.error);
          }
        },
        child: OrderViaLinkListview(
          order: order,
        ),
      ),
    );
  }
}
