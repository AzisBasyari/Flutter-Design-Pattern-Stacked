import 'package:flutter/material.dart';

class NavigatorService{
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  Future<dynamic> replaceTo(String routename, {dynamic arguments}){
    return _navigationKey.currentState.pushNamedAndRemoveUntil(routename, (route) => false);
  }

  void pop(){
    return _navigationKey.currentState.pop();
  }
}