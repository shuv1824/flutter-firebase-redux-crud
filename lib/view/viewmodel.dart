import 'package:todo/model/model.dart';
import 'package:todo/redux/actions.dart';
import 'package:redux/redux.dart';

class ViewModel {
  final List<Item> items;
  final Function(Item) onCompleted;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({
    this.items,
    this.onCompleted,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      Item item = Item(body: body);
      store.dispatch(AddItemAction(item));
    }

    _onCompleted(Item item) {
      store.dispatch(ItemCompletedAction(item));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
        items: store.state.items,
        onCompleted: _onCompleted,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems
    );
  }
}