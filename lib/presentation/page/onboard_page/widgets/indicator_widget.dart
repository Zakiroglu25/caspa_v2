import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
   Indicator({Key? key,required this.curr}) : super(key: key);
  int curr;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.black
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$curr"+"/"+"3",style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
