import 'package:flutter/material.dart';

class NotificationCancelButton extends StatelessWidget {
  final Function cancel;

  NotificationCancelButton(this.cancel);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -5,
        right: -4,
        child: IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            onPressed: () {
              //  Navigator.of(context).pop();
              cancel.call();
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 20,
            )));
  }
}
