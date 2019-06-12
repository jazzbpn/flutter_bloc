import 'package:bloc_test_1/Routes.dart';
import 'package:bloc_test_1/home/bloc/AddItemBloc.dart';
import 'package:bloc_test_1/home/bloc/CounterBloc.dart';
import 'package:bloc_test_1/home/bloc/ThemeBloc.dart';
import 'package:bloc_test_1/home/event/AddItemEvent.dart';
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
                builder: (BuildContext mContext, int count) {
                  return Center(
                    child: Text(
                      "Counter: " + '$count',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                },
              ),
              BlocBuilder<AddItemEvent, List<String>>(
                bloc: _addItemBloc,
                builder: (BuildContext mContext, List<String> dataList) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: dataList.length,
                          itemBuilder: (mContext, index) {
                            return ListTile(
                              onTap: () {
                                _addItemBloc.dispatch(ItemClickedAtEvent(
                                    position: index,
                                    updatedValue: "Updated: "));
                              },
                              onLongPress: () {
                                _addItemBloc.dispatch(
                                    ItemDelEventAtPosition(position: index));
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

  Container makeFab(ThemeBloc _themeBloc, AddItemBloc _addItemBloc,
      CounterBloc _counterBloc, BuildContext context) {
    return Container(
      child: Column(
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
            heroTag: "sasadwqesdasd",
            child: Icon(Icons.delete_forever),
            mini: true,
            backgroundColor: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.dispatch(CounterEvent.increment);
            },
            heroTag: "sadasdaasdfasdsadsd",
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
            heroTag: "dasd",
            child: Icon(Icons.remove),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            mini: true,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            heroTag: "sadasdasd",
            onPressed: () {
              _themeBloc.dispatch(ThemeEvent.toggle);
            },
            child: Icon(Icons.track_changes),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            mini: true,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, navigateForm);
            },
            heroTag: "zsdasdasdasd",
            child: Icon(Icons.list),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            mini: true,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, navigateSnackbar);
            },
            heroTag: "zsdasdasdasadfwrtd",
            child: Icon(Icons.branding_watermark),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            mini: true,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, navigateNavigator);
            },
            child: Icon(Icons.navigate_next),
            mini: true,
            heroTag: "taasdasdasdgsfdgerthrthgg1",
            backgroundColor: Colors.red,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            foregroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
