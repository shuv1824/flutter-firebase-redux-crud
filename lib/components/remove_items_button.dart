import 'package:flutter/material.dart';
import 'package:todo/view/viewmodel.dart';

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete All'),
      onPressed: () => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: const Text('All items will be deleted from the list'),
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
                  model.onRemoveItems();
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      ),
    );
  }
}