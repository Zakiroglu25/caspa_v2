import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, top: 4),
      child: Text(
        " " + ("$title"),
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
