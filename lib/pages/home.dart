import 'package:flutter/material.dart';
import 'package:todo/redux/actions.dart';

import 'package:todo/view/viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo/model/model.dart';
import 'package:todo/api.dart';

import 'package:todo/components/add_item.dart';
import 'package:todo/components/item_list.dart';
import 'package:todo/components/remove_items_button.dart';
import 'package:todo/pages/login.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      onInit: (store) => store.dispatch(GetItemsAction),
      builder: (BuildContext context, Store<AppState> store) => Scaffold(
        appBar: AppBar(
          title: Text("Relevant Todo"),
        ),
        body: StoreConnector <AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) => Column(
            children: <Widget>[
              AddItemWidget(viewModel),
              Expanded(child: ItemListWidget(viewModel),),
              RemoveItemsButton(viewModel),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            FirebaseAPI.signOutGoogle();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          },
          tooltip: 'Log Out',
          child: Icon(Icons.remove),
        ),
      ),
    );
  }
}