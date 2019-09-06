import 'package:flutter/foundation.dart';
import 'package:todo/helpers/uuid.dart';

class Item {
  final String id ;
  final String body;
  final bool completed;

  Item({
    @required this.body,
    this.completed = false,
    String id
  }) : this.id = id ?? Uuid().generateV4();

  Item copyWith({String id, String body, bool completed}) {
    return Item(
      id: id ?? this.id,
      body: body ?? this.body,
      completed: completed ?? this.completed
    );
  }

  Item.fromJson(Map json)
    : id = json['id'],
      body = json['body'],
      completed = json['completed'];

  Map toJson() => {
    'id' : id,
    'body': body,
    'completed': completed,
  };
}

class AppState {
  final List<Item> items;

  const AppState({ @required this.items });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);

  AppState.fromJson(Map json)
    : items = (json['items'] as List).map((i) => Item.fromJson(i)).toList();

  Map toJson() => { 'items': items };
}
