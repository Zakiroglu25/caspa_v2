import 'package:caspa_v2/util/constants/sized_box.dart';
import 'package:caspa_v2/util/screen/widget_or_empty.dart';
import 'package:flutter/material.dart';

class PropertyIndicator extends StatelessWidget {

  int? statusId;
  PropertyIndicator(this.statusId);

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: statusId!=null,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 12,
            color: statusId==0?Color.fromRGBO(242, 187, 68, 1): Colors.green,
          ),
          MySizedBox.w12,
        ],
      ),
    );
  }
}