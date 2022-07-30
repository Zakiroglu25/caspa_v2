import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/screen/ink_wrapper.dart';

class SlidableActionButton extends StatelessWidget {
  const SlidableActionButton(
      {Key? key, required this.color, required this.child, required this.onTap})
      : super(key: key);

  final Color color;
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: onTap,
      child: Container(
        width: 84.sp,
        height: 72.sp,
        child: SizedBox(width: 18, height: 18, child: Center(child: child)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
