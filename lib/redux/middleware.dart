import 'dart:async';
import 'package:redux/redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo/model/model.dart';
import 'package:todo/redux/actions.dart';

List<Middleware<AppState>> appStateMiddleware([
  AppState state = const AppState(items: [])
]) {
  final loadItems = _loadFromFirebase(state);
  final saveItems = _saveToFirebase(state);

  return [
    TypedMiddleware<AppState, AddItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemsAction>(saveItems),
    TypedMiddleware<AppState, GetItemsAction>(loadItems),
  ];
}

Middleware<AppState> _loadFromFirebase(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    // Load from firebase
    loadFromFirebase();
  };
}

Middleware<AppState> _saveToFirebase(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    // Save to firebase
    saveToFirebase(action);
  };
}

void saveToFirebase(AddItemAction action) async {
  await Firestore.instance.collection('todos').document().setData(action.item.toJson());
}

Stream<List<Item>> loadFromFirebase() {
  return Firestore.instance.collection('todos').snapshots().map((snapshot) {
    return snapshot.documents.map((doc) {
      return Item(
        id: doc['id'],
        body: doc['body'],
        completed: doc['completed']
      );
    }).toList();
  });
}


