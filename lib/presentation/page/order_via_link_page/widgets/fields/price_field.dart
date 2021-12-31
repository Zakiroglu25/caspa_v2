
import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController ?controller;

  PriceFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width/1.5)-10,
      child: StreamBuilder<double>(
        stream: BlocProvider.of<OrderViaUrlCubit>(context).priceStream,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.price,
            maxLines: 1,
            hint: MyText.price,
            upperCase: true,
            suffixText: MyText.tryy+"   ",
            textInputType: TextInputType.phone,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            //  controller: controller,
            onChanged: (value) =>
                BlocProvider.of<OrderViaUrlCubit>(context).updatePrice(value),
          );
        },
      ),
    );
  }
}
