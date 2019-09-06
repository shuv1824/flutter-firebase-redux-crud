import 'package:flutter/material.dart';
import 'package:todo/api.dart';
//import 'dart:async';

import 'package:todo/pages/home.dart';

class LoginPage extends StatelessWidget {
//  Future<bool> _loginUser() async {
//    final api = FirebaseAPI.signInWithGoogle();
//    if(api != null) {
//      return true;
//    } else {
//      return false;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relevant Todo"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: OutlineButton(
              splashColor: Colors.grey,
              onPressed: () {
                FirebaseAPI.signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MyHomePage();
                      },
                    ),
                  );
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage("images/google_logo.png"), height: 35.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
