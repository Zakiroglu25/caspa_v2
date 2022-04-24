import 'dart:io';

import 'package:caspa_v2/util/constants/text.dart';
import 'package:caspa_v2/widget/caspa_appbar/caspa_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // void getLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  // }

  GoogleMapController? mapController; //contrller for Google map

  //String googleAPiKey = "AIzaSyCl9unOJXetN8qXHPdfH9jmvpRYesUu750";

  Set<Marker> markers = Set(); //markers for google map
  var lat = 40.387281;
  var long = 49.804749;
  var locationStart = LatLng(40.387281, 49.804749);

  double distance = 0.0;

  @override
  void initState() {
    // getLocation();

    markers.add(Marker(
      markerId: MarkerId(locationStart.toString()),
      position: locationStart,
      onTap: () {
        if (Platform.isIOS) {
          launchWaze(lat, long);
        } else if (Platform.isAndroid) {
          launchGoogleMaps(lat, long);
        } else if (Platform.isAndroid) {
          launchWaze(lat, long);
        }
      },
      infoWindow: InfoWindow(
        title: 'Caspa Bakı Anbar',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CaspaAppbar(
        user: false,
        title: MyText.map,
        notification: false,
        contextA: context,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: locationStart, //initial position
          zoom: 17.0, //initial zoom level
        ),
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

  void launchWaze(double lat, double lng) async {
    var url = 'waze://?ll=${lat.toString()},${lng.toString()}';
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        //await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      // await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  void launchGoogleMaps(double lat, double lng) async {
    var url = 'google.navigation:q=${lat.toString()},${lng.toString()}';
    var fallbackUrl =
        'https://www.google.com/maps/search/?api=1&query=${lat.toString()},${lng.toString()}';
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }
}
