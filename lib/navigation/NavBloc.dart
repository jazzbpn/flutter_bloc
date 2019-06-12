import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/navigation/NavEvent.dart';
import 'package:bloc_test_1/navigation/NavState.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  @override
  NavState get initialState => StateA();

  @override
  Stream<NavState> mapEventToState(NavEvent event) async* {
    switch (event) {
      case NavEvent.eventA:
        yield StateA();
        break;
      case NavEvent.eventB:
        yield StateB();
        break;
    }
  }
}
