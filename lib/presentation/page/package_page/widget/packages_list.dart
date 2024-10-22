import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/paddings.dart';
import 'package:caspa_v2/util/constants/physics.dart';
import 'package:caspa_v2/widget/main/package_box/package_box.dart';
import 'package:flutter/material.dart';

import 'empty_widget_packages.dart';

class PackagesList extends StatelessWidget {
  final List<Package>? packages;

  PackagesList({required this.packages});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final sW = size.width;
    final List<Package>? packageList = packages!.reversed.toList();
    if (packages!.length == 0) {
      return EmptyPackagesWidget();
    }
    return Stack(
      children: [
        GridView.builder(
          padding: Paddings.paddingA20,
          physics: Physics.alwaysBounce,
          itemCount: packageList!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 3
                    : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: (1 / 1.15),
          ),
          itemBuilder: (
            context,
            index,
          ) {
            return PackageBox(
              package: packageList[index],
              w: sW,
              index: index,
            );
          },
        ),
      ],
    );
  }
}
