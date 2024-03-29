import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_flutter/route_name.dart';
import 'package:stacked_flutter/ui/view/home_view.dart';



Route<dynamic> generateRoute (RouteSettings settings){
  switch(settings.name){
    case HomeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomeView()
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("No Defined to ${settings.name}"),
          ),
        )
      );
  }
}

PageRoute _pageRoute ({String routeName, Widget viewToShow}){
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName
    ),
    builder: (_) => viewToShow
  );
}