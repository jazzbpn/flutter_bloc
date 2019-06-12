import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/snack_bar/DataEvent.dart';
import 'package:bloc_test_1/snack_bar/DataState.dart';

class DataBloc extends Bloc<DataEvent, DataState>{
  @override
  DataState get initialState => Initial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async*{
    if(event is FetchData){
      yield Loading();
      await Future.delayed(Duration(seconds: 2));
      yield Success();
    }
  }

}