import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'widget/info_page.dart';

class PackageDetailsPage extends StatelessWidget {
  final Package package;

  PackageDetailsPage({required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: package.store,
        color: AppOperations.colorWithId(package.id!),
        notification: false,
      ),
      body: SafeArea(
        child: PackageDetails(
          package: package,
        ),
      ),
    );
  }
}
