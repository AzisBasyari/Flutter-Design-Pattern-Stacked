import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked_flutter/locator.dart';
import 'package:stacked_flutter/services/navigator_service.dart';
import 'package:stacked_flutter/ui/router.dart';
import 'package:stacked_flutter/ui/view/login_view.dart';

void main() {
 setupLocator();
 runZoned((){runApp(MyApp());});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
        navigatorKey: locator<NavigatorService>().navigationKey,
        onGenerateRoute: generateRoute,
    );
  }
}