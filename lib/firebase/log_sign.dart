import 'package:cs_app/firebase/login_signup.dart';
import 'package:cs_app/screens/overboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void login(BuildContext context, String email, String password) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  userProvider.login(email, password).then((_) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Overboard(
                title: 'hi',
              )),
    );
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login Failed: $error"),
    ));
  });
}

void signUp(BuildContext context, String name, String email, String password) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  userProvider.signUp(name, email, password).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Registration Successful"),
    ));
  }).catchError((error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Registration Failed: $error"),
    ));
  });
}
