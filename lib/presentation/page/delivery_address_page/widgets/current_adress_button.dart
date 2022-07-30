import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CurrentAdressButton extends StatelessWidget {
  const CurrentAdressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      left: 16,
      bottom: 30,
      child: CaspaButton(
        h: 72,
        onTap: () async {
          final position = await _determinePosition();
          bbbb('kllllll: $position');
          debugPrint('location: ${position.latitude}');

          List<Placemark> addresses = await placemarkFromCoordinates(
              position.latitude, position.longitude);

          var first = addresses.first;
          print("${first.name} : ${first..administrativeArea}");

          // print("${first.featureName} : ${first.addressLine}");
        },
        child: Padding(
          padding: Paddings.paddingA16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svgSend),
              MySizedBox.w16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyText.currentAdress,
                    style: AppTextStyles.sanF500.copyWith(
                        color: MyColors.white, fontWeight: FontWeight.w600),
                  ),
                  MySizedBox.h4,
                  Text(
                    "Qara Qarayev 8",
                    style: AppTextStyles.sanF500
                        .copyWith(color: MyColors.white, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
