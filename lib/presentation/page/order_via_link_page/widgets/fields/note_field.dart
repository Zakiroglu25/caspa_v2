import 'package:caspa_v2/infrastructure/cubits/order_via_url/order_via_url_cubit.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/general/caspa_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteFieldOrderViaUrl extends StatelessWidget {
  final TextEditingController? controller;

  NoteFieldOrderViaUrl({this.controller}); //= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (controller!.text != '')
      BlocProvider.of<OrderViaUrlCubit>(context).updateNote(controller!.text);
    return StreamBuilder<String>(
      stream: BlocProvider.of<OrderViaUrlCubit>(context).noteStream,
      builder: (context, snapshot) {
        return CaspaField(
          title: MyText.note,
          maxLines: 1,
          hint: MyText.note,
          upperCase: true,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.sentences,
          errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          controller: controller,
          onChanged: (value) =>
              BlocProvider.of<OrderViaUrlCubit>(context).updateNote(value),
        );
      },
    );
  }
}
