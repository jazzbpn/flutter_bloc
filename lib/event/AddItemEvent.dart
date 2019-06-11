import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddItemEvent extends Equatable {
  AddItemEvent([List props = const []]) : super(props);
}

class ItemClickedAtEvent extends AddItemEvent {
  final updatedValue;
  final int position;
  ItemClickedAtEvent({@required this.position, @required this.updatedValue}) : super([position,updatedValue ]);
}

class ItemAddEvent extends AddItemEvent {
  final String item;
  ItemAddEvent({@required this.item}) : super([item]);
}

class ItemDelEvent extends AddItemEvent {
  final String data;
  ItemDelEvent({@required this.data}) : super([data]);
}

class ItemDelEventAtPosition extends AddItemEvent {
  final int position;
  ItemDelEventAtPosition({@required this.position}) : super([position]);
}