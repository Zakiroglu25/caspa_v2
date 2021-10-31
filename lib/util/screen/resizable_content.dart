import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:flutter/material.dart';

class ResizableContent extends StatelessWidget {
  Widget ?child;
  AppBar ? appBar;


  ResizableContent({required this.child,this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          //  color: Colors.green,
          padding: Paddings.paddingH20,
          height: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: child,
          ),
        ),
      ),
    );
  }
}
