//class LocalCargoField extends StatelessWidget {

import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/enums/field_type.dart';

class LocalCargoFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController? controller;
  int _value2 = 20;
  LocalCargoFieldOrderViaUrl(
      {this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '')
      BlocProvider.of<OrderViaUrlCubit>(context)
          .updateLocalCargo(controller!.text);
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 1.5) - 10,
      child: StreamBuilder<double>(
        stream: BlocProvider.of<OrderViaUrlCubit>(context).localCargoStream,
        builder: (context, snapshot) {
          return CaspaField(
            title: MyText.foreing_cargo_price,
            maxLines: 1,
            hint: MyText.foreing_cargo_price,
            upperCase: true,
            suffixText: MyText.tryy + "   ",
            textInputType: const TextInputType.numberWithOptions(
                signed: false, decimal: true),
            fieldType: FieldType.currency,
            textCapitalization: TextCapitalization.sentences,
            errorMessage: snapshot.error == null ? null : '${snapshot.error}',
            controller: controller,
            onChanged: (value) => BlocProvider.of<OrderViaUrlCubit>(context)
                .updateLocalCargo(value),
          );
        },
      ),
    );
  }
}
