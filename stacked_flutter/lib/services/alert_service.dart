import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlertService{
  void showWarning(BuildContext context, String title, String desc, Function onCancel){
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("$title"),
        content: Text("$desc"),
        actions: <Widget>[
          TextButton(
            onPressed: onCancel,
            child: Text("OK"),
          )
        ],
      )
    );
  }
}