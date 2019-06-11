import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddItemEvent2 extends Equatable {
  AddItemEvent2([List props = const []]) : super(props);
}

class ItemClickedAtEvent extends AddItemEvent2 {
  final int position;
  ItemClickedAtEvent({@required this.position}) : super([position]);
}

class ItemAddEvent extends AddItemEvent2 {
  final String item;
  ItemAddEvent({@required this.item}) : super([item]);
}

class ItemDelEvent extends AddItemEvent2 {
  final int position;
  ItemDelEvent({@required this.position}) : super([position]);
}
