import 'package:get_it/get_it.dart';
import 'package:stacked_flutter/services/alert_service.dart';
import 'package:stacked_flutter/services/geolocator_service.dart';
import 'package:stacked_flutter/services/location_service.dart';
import 'package:stacked_flutter/services/navigator_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => GeolocatorService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => UserLocation());
}