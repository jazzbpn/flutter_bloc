import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/AddItemBloc.dart';
import 'package:bloc_test_1/CounterBloc.dart';
import 'package:bloc_test_1/MyHomePage.dart';
import 'package:bloc_test_1/SimpleBlogDelegate.dart';
import 'package:bloc_test_1/ThemeBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();
  final AddItemBloc _addItemBloc = AddItemBloc();
  final ThemeBloc _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
        blocProviders: [
          BlocProvider<CounterBloc>(bloc: _counterBloc),
          BlocProvider<AddItemBloc>(bloc: _addItemBloc),
          BlocProvider<ThemeBloc>(bloc: _themeBloc),
        ],
        child: BlocBuilder(
          bloc: _themeBloc,
          builder: (_, ThemeData theme) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: theme,
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ));
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    _addItemBloc.dispose();
    _themeBloc.dispose();
    super.dispose();
  }
}
