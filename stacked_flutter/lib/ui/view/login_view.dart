import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_flutter/viewmodels/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: ()=> LoginViewModel(),

      builder: (context, model, child)=>Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextFormField(
                  controller: model.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextFormField(
                  controller: model.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(8, 16, 8, 2),
                child: ElevatedButton(
                  onPressed: () {
                    model.loginAccount(context);
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}