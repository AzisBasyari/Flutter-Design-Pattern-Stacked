import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation{
  double latitude;
  double longitude;
  String addressLine;

  UserLocation({
    this.latitude,
    this.longitude,
    this.addressLine
  });
}

class GeolocatorService{
  Future<UserLocation>getCurrentLocation() async{
    try{
      var addressLine = '';

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      final Coordinates coordinates = Coordinates(position.latitude, position.longitude);
      // ignore: non_constant_identifier_names
      final Address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      
      if(position.isMocked){
        addressLine = Address.first.addressLine + "#FakeLocation";
      } else {
        addressLine = Address.first.addressLine;
      }

      UserLocation userLocation = UserLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        addressLine: addressLine,
      );

      return userLocation;
    } catch(e) {
      print("Gagal Mengakses Lokasi Saat ini $e");
      return null;
    }
  }
}