import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class ResizableContent extends StatelessWidget {
  Widget? child;
  Widget? footer;
  AppBar? appBar;

  ResizableContent({required this.child, this.appBar, this.footer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: FooterLayout(
          footer: footer,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
                //color: Colors.green,
                padding: Paddings.paddingH20,
                height: double.maxFinite,
                child: child),
          ),
        ),
      ),
    );
  }
}
