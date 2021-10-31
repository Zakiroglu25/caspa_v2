import 'package:caspa_v2/util/constants/assets.dart';
import 'package:flutter/material.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12,top: 16),
      child: Stack(
        children: [
          Image.asset(Assets.news1),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              "Çatdırılma\n1 AZN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
