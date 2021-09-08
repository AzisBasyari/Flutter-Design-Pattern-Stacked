import 'package:location/location.dart';

class LocationService{
  bool _serviceEnable;
  final Location location = new Location();

  Future<void> checkService() async{
    _serviceEnable = await location.serviceEnabled();
    
    if(!_serviceEnable){
      _serviceEnable = await location.requestService();
    }
  }
}