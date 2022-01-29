import 'package:flutter/material.dart';

class WidgetOrEmpty extends StatelessWidget {
  final bool? value;
  final Widget? child;
  final Widget? elseChild;

  WidgetOrEmpty({required this.value, required this.child, this.elseChild});

  @override
  Widget build(BuildContext context) {
    return ((value ?? false)
        ? child ?? Container()
        : (elseChild ?? Container()));
  }
}
