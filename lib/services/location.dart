import 'package:geolocator/geolocator.dart';

// 1 page get permission  from the phone and take the lat and long
class Location {
  // to assign val for them to use it in other place
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    // try its something to catch the error and dont crash the app
    try {
      // to give the permission to get the location
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      // this in for get location and also indeed to put something in the manifest file to get the permeation
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // low to save the battery when use location
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
