import 'package:animate_do/animate_do.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address/delivery_address_cubit.dart';
import 'package:caspa_v2/infrastructure/cubits/delivery_address_current/delivery_address_current_state.dart';
import 'package:caspa_v2/infrastructure/cubits/report/report_cubit.dart';
import 'package:caspa_v2/util/constants/durations.dart';
import 'package:caspa_v2/util/delegate/my_printer.dart';
import 'package:caspa_v2/widget/general/caspa_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocode/geocode.dart';
import '../../../../infrastructure/cubits/delivery_address_current/delivery_address_current_cubit.dart';
import '../../../../util/constants/app_text_styles.dart';
import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/custom/buttons/caspa_button.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoder2/geocoder2.dart';
import 'package:flutter/services.dart';

import 'location_button_text.dart';

class CurrentAddressButton extends StatelessWidget {
  const CurrentAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      left: 16,
      bottom: 30,
      child: CaspaButton(
        h: 76,
        //isButtonActive: !(state is DeliveryAddressCurrentError),
        onTap: () async {
          bbbb('kllllll: ${context.read<DeliveryAddressCurrentCubit>().state}');
          final state = context.read<DeliveryAddressCurrentCubit>().state;
          if (state is DeliveryAdressCurrentDisabled) {
            context
                .read<DeliveryAddressCurrentCubit>()
                .showAccessAlert(context);
          }
          if ((state is DeliveryAddressCurrentError)) {
            context.read<DeliveryAddressCurrentCubit>().get();
            // context
            // .read<DeliveryAddressCurrentCubit>()
            // .showAccessAlert(context);

            return;
          }
          context.read<DeliveryAddressCurrentCubit>().add(context);
        },
        child: AnimatedContainer(
          duration: Durations.ms500,
          child: Padding(
            padding: Paddings.paddingA16 - Paddings.paddingV4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.svgSend),
                MySizedBox.w16,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyText.currentAdress,
                        style: AppTextStyles.sanF500.copyWith(
                            color: MyColors.white, fontWeight: FontWeight.w600),
                      ),
                      MySizedBox.h4,
                      BlocConsumer<DeliveryAddressCurrentCubit,
                          DeliveryAddressCurrentState>(
                        listener: (context, state) {
                          if (state is DeliveryAdressCurrentAdded) {
                            context.read<DeliveryAddressCubit>().get();
                          }
                        },
                        builder: (context, state) {
                          if (state is DeliveryAdressCurrentSuccess) {
                            final address = state.address;
                            //final location = state.location;
                            return LocationButtonText(
                              text: address,
                            );
                          }
                          if (state is DeliveryAdressCurrentInProgress) {
                            return Container(
                              height: 4,
                              margin: Paddings.paddingV5,
                              width: 93,
                              child: LinearProgressIndicator(
                                color: MyColors.white,
                                backgroundColor: MyColors.mainOpacityDark,
                              ),
                            );
                          }
                          if (state is DeliveryAdressCurrentDenied) {
                            return LocationButtonText(
                              text: MyText.locationAccessDenied,
                            );
                          }
                          if (state is DeliveryAdressCurrentDisabled) {
                            return LocationButtonText(
                              text: MyText.locationAccessDisabled,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
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

  getUserLocation() async {
    //call this async method from whereever you need

    loc.LocationData? myLocation;
    String error;
    loc.Location location = new loc.Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    //currentLocation = myLocation;
    GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: 40.714224,
        longitude: -73.961452,
        googleMapApiKey: "AIzaSyCl9unOJXetN8qXHPdfH9jmvpRYesUu750");
  }

  getLocation() async {
    GeoCode geoCode = GeoCode();

    loc.LocationData? myLocation;
    String error;
    loc.Location location = new loc.Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }

    try {
      // Coordinates coordinates = await geoCode.forwardGeocoding(
      //     address: "532 S Olive St, Los Angeles, CA 90013");
      // print("Latitude: ${coordinates.latitude}");
      // print("Longitude: ${coordinates.longitude}");
      final k = _getBatteryLevel(myLocation!.latitude!, myLocation.longitude!);
      // Address address = await geoCode.reverseGeocoding(
      //     latitude: myLocation!.latitude!, longitude: myLocation.longitude!);
      print(k);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getBatteryLevel(double a, double b) async {
    String latlng;
    try {
      final String result =
          await const MethodChannel('samples.flutter.dev/latlng')
              .invokeMethod('latlng', <String, dynamic>{"lat": a, "lng": b});
      latlng = result;
    } on PlatformException catch (e) {
      latlng = "Failed to get latlng level: '${e.message}'.";
    }
  }
}
