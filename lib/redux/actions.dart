import 'package:todo/model/model.dart';

class AddItemAction {
  final Item item;

  AddItemAction(this.item);
}

class ItemCompletedAction {
  final Item item;

  ItemCompletedAction(this.item);
}

class RemoveItemAction {
  final Item item;

  RemoveItemAction(this.item);
}

class RemoveItemsAction {}

class GetItemsAction {}

class LoadedItemsAction {
  List<Item> items;

  LoadedItemsAction(this.items);
}
