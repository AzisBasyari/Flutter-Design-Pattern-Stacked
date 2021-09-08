import 'package:flutter/material.dart';
import 'package:stacked_flutter/viewmodels/location_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      viewModelBuilder: () => LocationViewModel(),

      onModelReady: (model){
        model.openLocationSetting();
      },

      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Latitude: ", textAlign: TextAlign.center),
                  SizedBox(width: 50),
                  Text("${model.lat}", textAlign: TextAlign.center)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Longitude: ", textAlign: TextAlign.center),
                  SizedBox(width: 50),
                  Text("${model.long}", textAlign: TextAlign.center)
                ],
              ),

              
              SizedBox(height: 20),
              Text("Address: ", textAlign: TextAlign.center),
              Text("${model.address}", textAlign: TextAlign.center)
              
            ],
          ),
        ),
      ),
    );
  }
}