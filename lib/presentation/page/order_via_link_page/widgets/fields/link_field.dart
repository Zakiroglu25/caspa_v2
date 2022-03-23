import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinkFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController? controller;

  LinkFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '' && controller!.text != 'null')
      BlocProvider.of<OrderViaUrlCubit>(context).updateLink(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<OrderViaUrlCubit>(context).linkStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.link_of_order,
          maxLines: 1,
          hint: MyText.link_of_order,
          upperCase: false,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<OrderViaUrlCubit>(context).updateLink(value),
        );
      },
    );
  }
}
