import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:caspa_v2/widget/caspa_appbar/widgets/user_button.dart';
import 'package:flutter/material.dart';

class SliverBack extends StatelessWidget {
  final bool? back;
  const SliverBack({Key? key, this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 4,
      child: WidgetOrEmpty(
        value: back,
        child: const BackButton(),
        elseChild: UserButton(),
      ),
    );
  }
}
