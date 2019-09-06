import 'package:flutter/material.dart';
import 'package:todo/view/viewmodel.dart';
import 'package:todo/model/model.dart';


class ItemListWidget extends StatelessWidget {
  final ViewModel model;

  ItemListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: model.items
            .map((Item item) => ListTile(
          title: Text(
            item.body,
            style: TextStyle(decoration: item.completed ? TextDecoration.lineThrough : TextDecoration.none),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are you sure?'),
                  content: const Text('This todo will be removed from the list'),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        model.onRemoveItem(item);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            ),
          ),
          leading: Checkbox(
            value: item.completed,
            onChanged: (val) {
              model.onCompleted(item);
            },
          ),
        )).toList()
    );
  }
}