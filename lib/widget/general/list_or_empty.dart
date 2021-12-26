import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/general/empty_widget.dart';
import 'package:flutter/material.dart';

class ListOrEmpty extends StatelessWidget {
  final List<dynamic>? list;
  final Widget child;

  ListOrEmpty({required this.list, required this.child});

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(value:(list!=null && list?.length != 0 ) , child: child,
    elseChild: EmptyWidget(),);
  }
}
