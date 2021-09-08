import 'dart:io';
import 'package:stacked_flutter/locator.dart';
import 'package:stacked_flutter/services/geolocator_service.dart';
import 'package:stacked_flutter/services/location_service.dart';
import 'package:stacked_flutter/viewmodels/base_model.dart';

class LocationViewModel extends BaseModel{
  final GeolocatorService _geolocatorService = locator<GeolocatorService>();
  final LocationService _locationService = locator<LocationService>();

  double lat = 0.0;
  double long = 0.0;
  String address;

  // ignore: non_constant_identifier_names
  void init_state() async{
    setBusy(true);
    await _locationService.checkService();
    await getLocation();
    await cek_data();
  }

  void openLocationSetting() async{
    cek_data();
    await _locationService.checkService();
    await getLocation();
  }

  Future<void>getLocation() async{
    setBusy(true);
    try{
      final userLocation = await _geolocatorService.getCurrentLocation();
      lat = userLocation.latitude;
      long = userLocation.longitude;
      address = userLocation.addressLine;
      setBusy(false);
    } catch(e) {
      setBusy(false);
    }
  }

  // ignore: non_constant_identifier_names
  Future<void>cek_data() async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty && result[0].rawAddress.isNotEmpty){
        print("Connected!");
        return("Connected!");
      }
    } on SocketException catch(_){
      print("Not Connected!");
      return("Disconnected!");
    }
  }
}