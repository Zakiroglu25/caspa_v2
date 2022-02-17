import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/package_details/package_details_state.dart';
import 'package:caspa_v2/infrastructure/models/remote/response/packages_data.dart';
import 'package:caspa_v2/presentation/page/webview_page/webview_page.dart';
import 'package:caspa_v2/util/constants/colors.dart';
import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/util/delegate/app_operations.dart';
import 'package:caspa_v2/util/delegate/navigate_utils.dart';
import 'package:caspa_v2/util/screen/full_screen_loading.dart';
import 'package:caspa_v2/util/screen/snack.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/package_details.dart';

class PackageDetailsPage extends StatelessWidget {
  final Package package;

  PackageDetailsPage({required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: package.store,
        contextA: context,
        color: AppOperations.colorWithId(package.id!),
        notification: false,
      ),
      body: SafeArea(
        child: BlocConsumer<PackageDetailsCubit, PackageDetailsState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is PackageDetailsPayError) {
              Snack.display(context: context, message: state.error);
            }
            if (state is PackageDetailsInProgress) {
              FullScreenLoading.display(context);
            } else {
              FullScreenLoading.hide(context);
            }
            if (state is PackageDetailsPaid) {
              Go.pop(context);
              Snack.positive(
                  context: context, message: MyText.operationIsSuccess);
            }
          },
          builder: (context, state) {
            if (state is PackageDetailsUrlFetched) {
              return WebviewPage(
                url: state.url,
                mainContext: context,
                whenSuccess: () =>
                    context.read<PackageDetailsCubit>().paymentSuccess(context),
              );
            }
            return PackageDetails(
              package: package,
            );
          },
        ),
      ),
    );
  }
}
