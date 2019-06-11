import 'package:bloc_test_1/AddItemBloc.dart';
import 'package:bloc_test_1/AddItemEvent2.dart';
import 'package:bloc_test_1/CounterBloc.dart';
import 'package:bloc_test_1/ThemeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final AddItemBloc _addItemBloc = BlocProvider.of<AddItemBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              BlocBuilder<CounterEvent, int>(
                bloc: _counterBloc,
                builder: (BuildContext context, int count) {
                  return Center(
                    child: Text(
                      "Counter: " + '$count',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                },
              ),
              BlocBuilder<AddItemEvent2, List<String>>(
                // BlocBuilder<AddItemEvent, String>(
                bloc: _addItemBloc,
                builder: (BuildContext context, List<String> dataList) {
                  // builder: (BuildContext context, String dataList) {
                  debugPrint("Home-ListData: " +
                      dataList.toString() +
                      "  ---> Home-ListLength: " +
                      dataList.length.toString());
                  return Expanded(
                      child: ListView.builder(
                          itemCount: dataList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                _addItemBloc.dispatch(ItemClickedAtEvent(position: index, updatedValue: "Updated: "));
                              },
                              onLongPress: () {
                                _addItemBloc.dispatch(ItemDelEventAtPosition(position: index));
                              },
                              title: Text(
                                dataList[index],
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                            );
                          }));
                },
              )
            ],
          ),
        ),
        floatingActionButton:
            makeFab(_themeBloc, _addItemBloc, _counterBloc, context));
  }

  Row makeFab(ThemeBloc _themeBloc, AddItemBloc _addItemBloc,
      CounterBloc _counterBloc, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            _addItemBloc.dispatch(ItemAddEvent(item: "Some data"));
          },
          child: Icon(Icons.add_comment),
          mini: true,
          heroTag: "tagg1",
          backgroundColor: Colors.red,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          foregroundColor: Colors.white,
        ),
        FloatingActionButton(
          onPressed: () {
            _addItemBloc.dispatch(ItemDelEvent(data: ""));
          },
          child: Icon(Icons.delete_forever),
          mini: true,
          heroTag: "tagg1",
          backgroundColor: Colors.red,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          foregroundColor: Colors.white,
        ),
        FloatingActionButton(
          onPressed: () {
            _counterBloc.dispatch(CounterEvent.increment);
          },
          heroTag: "tagg11",
          child: Icon(Icons.add),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          mini: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        FloatingActionButton(
          onPressed: () {
            _counterBloc.dispatch(CounterEvent.decrement);
          },
          heroTag: "tagg11",
          child: Icon(Icons.remove),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          mini: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        FloatingActionButton(
          onPressed: () {
            _themeBloc.dispatch(ThemeEvent.toggle);
          },
          heroTag: "tagg11",
          child: Icon(Icons.track_changes),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          mini: true,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ],
    );
  }
}
