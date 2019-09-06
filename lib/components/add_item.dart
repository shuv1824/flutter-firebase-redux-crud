import 'package:flutter/material.dart';
import 'package:todo/view/viewmodel.dart';

class AddItemWidget extends StatefulWidget {
  final ViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.zero,
                    ),
                  ),
                  labelText: 'Add a task to the list',
                ),
                onSubmitted: (String s) {
                  widget.model.onAddItem(s);
                  controller.text = '';
                }
            ),
          ),
          FlatButton(
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.all(21.0),
            splashColor: Colors.greenAccent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(5.0),
              ),
            ),
            onPressed: () {
              widget.model.onAddItem(controller.text);
              controller.text = '';
            },
            child: Text('ADD'),
          )
        ],
      ),
    );
  }
}