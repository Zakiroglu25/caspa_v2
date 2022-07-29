import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';

class ListOrEmpty extends StatelessWidget {
  final List<dynamic>? list;
  final Widget child;
  final Widget? elseChild;
  final String? text;
  final String? description;

  ListOrEmpty(
      {required this.list,
      required this.child,
      this.text,
      this.description,
      this.elseChild});

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: (list != null && list?.length != 0),
      child: child,
      elseChild: EmptyWidget(
        elseChild: elseChild,
        h: MediaQuery.of(context).size.height / 2,
        text: text,
        description: description,
      ),
    );
  }
}
