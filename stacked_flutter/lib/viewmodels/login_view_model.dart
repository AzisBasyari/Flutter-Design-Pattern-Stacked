import 'package:flutter/cupertino.dart';
import 'package:stacked_flutter/locator.dart';
import 'package:stacked_flutter/route_name.dart';
import 'package:stacked_flutter/services/alert_service.dart';
import 'package:stacked_flutter/services/navigator_service.dart';
import 'package:stacked_flutter/viewmodels/base_model.dart';

class LoginViewModel extends BaseModel{
  final NavigatorService _navigationService = locator<NavigatorService>();
  final AlertService _alertService = locator<AlertService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  void loginAccount(context){
    if (emailController.text == "flutter" && passwordController.text == "flutter123"){
      print("Login Berhasil!");
      _navigationService.replaceTo(HomeViewRoute);
      _alertService.showWarning(context, "Selamat", "Login Berhasil!", _navigationService.pop);
    } else {
      print("Login Gagal!");
      _alertService.showWarning(context, "Peringatan", "Email atau Password Salah!", _navigationService.pop);
    }
  }
}