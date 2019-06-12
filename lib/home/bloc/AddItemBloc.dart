import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/home/event/AddItemEvent.dart';

class AddItemBloc extends Bloc<AddItemEvent, List<String>> {
  List<String> initialData = [];

  @override
  List<String> get initialState => getInitialData();

  @override
  Stream<List<String>> mapEventToState(AddItemEvent event) async* {
    if (event is ItemAddEvent) {
      currentState.add(event.item);
      yield currentState.toList();
    } else if (event is ItemDelEvent) {
      currentState.removeAt(currentState.length - 1);
      yield currentState.toList();
    } else if (event is ItemDelEventAtPosition) {
      currentState.removeAt(event.position);
      yield currentState.toList();
    } else if (event is ItemClickedAtEvent) {
      currentState[event.position] =
          event.updatedValue + currentState[event.position];
      yield currentState.toList();
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
