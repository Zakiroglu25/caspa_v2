import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:flutter/material.dart';

import 'list_sliver_handler.dart';
import 'package_sliver_list.dart';

class PackageDetails extends StatelessWidget {
  final Package package;
  PackageDetails({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bbbb("data: ${package.archive}");
    return Container(
      color: AppOperations.colorWithId(package.id!),
      child: SlideInUp(
        duration: const Duration(milliseconds: 200),
        from: 200,
        child: Container(
          color: MyColors.white,
          child: CustomScrollView(
            slivers: <Widget>[
              ListSliverHandler(
                package: package,
              ),
              PackageSliverList(
                package: package,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
