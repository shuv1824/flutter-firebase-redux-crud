import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo/model/model.dart';
import 'package:todo/redux/reducers.dart';
import 'package:todo/redux/middleware.dart';

//import 'package:todo/pages/home.dart';
import 'package:todo/pages/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: appStateMiddleware(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Relevant Todo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
//        routes: {
//          "home-page": (context) => MyHomePage(),
//          "login-page": (context) => LoginPage(),
//        },
        home: LoginPage(),
      ),
    );
  }
}
