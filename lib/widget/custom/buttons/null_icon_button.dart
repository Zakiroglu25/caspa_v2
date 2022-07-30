import 'package:flutter/material.dart';

import '../../../util/constants/paddings.dart';

class NullIconButton extends StatelessWidget {
  const NullIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        margin: Paddings.paddingA8,
        width: 12,
        height: 12,
      ),
      onPressed: null,
    );
  }
}
