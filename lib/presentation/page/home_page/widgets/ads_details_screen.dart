import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/models/remote/response/ads_model.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/delegate/navigate_utils.dart';

class AdsDetailsPage extends StatelessWidget {
  const AdsDetailsPage({Key? key, required this.hList}) : super(key: key);

  final Data hList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 16,
              top: 16,
              child: InkWell(
                  onTap: () => Go.pop(context), child: Icon(Icons.clear)),
            ),
            Center(
                child: Hero(
                    tag: hList.image!,
                    child: Image.network(hList.image.toString()))),
          ],
        ),
      ),
    );
  }
}
