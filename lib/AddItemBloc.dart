import 'package:bloc/bloc.dart';

enum AddItemEvent { addItem, deleteItem, updateItem, deleteItemAtPosition }

class AddItemBloc extends Bloc<AddItemEvent, List<String>> {
  List<String> initialData = [];

  @override
  List<String> get initialState => getInitialData();

  @override
  Stream<List<String>> mapEventToState(AddItemEvent event) async* {

    switch (event) {
      case AddItemEvent.addItem:
        currentState.add("Added val ");
        yield currentState.toList();
        break;
      case AddItemEvent.deleteItem:
        currentState.removeAt(currentState.length - 1);
        yield currentState.toList();
        break;
      case AddItemEvent.updateItem:
        yield currentState.toList();
        break;
      case AddItemEvent.deleteItemAtPosition:
        yield currentState.toList();
        break;
    }
  }

  List<String> getInitialData() {
    initialData.add("Item 1");
    initialData.add("Item 2");
    initialData.add("Item 3");
    initialData.add("Item 4");
    initialData.add("Item 5");
    initialData.add("Item 6");
    initialData.add("Item 7");
    initialData.add("Item 8");
    initialData.add("Item 9");
    initialData.add("Item 10");
    return initialData;
  }
}
