
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController ?controller;

  CountFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: BlocProvider.of<OrderViaUrlCubit>(context).productCountStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.product_count,
          maxLines: 1,
          hint: MyText.product_count,
          upperCase: true,
          suffixText: MyText.pcs+"   ",
          textInputType: TextInputType.phone,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          //  controller: controller,
          onChanged: (value) =>
              BlocProvider.of<OrderViaUrlCubit>(context).updateProductCount(value),
        );
      },
    );
  }
}
