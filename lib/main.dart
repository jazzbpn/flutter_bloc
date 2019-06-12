import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/Routes.dart';
import 'package:bloc_test_1/SimpleBlogDelegate.dart';
import 'package:bloc_test_1/form/widget/MyFormPage.dart';
import 'package:bloc_test_1/home/bloc/AddItemBloc.dart';
import 'package:bloc_test_1/home/bloc/CounterBloc.dart';
import 'package:bloc_test_1/home/bloc/ThemeBloc.dart';
import 'package:bloc_test_1/home/widget/MyHomePage.dart';
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
                initialRoute: '/',
                routes: {
                  navigateRoot:(context) => MyHomePage(title: 'Flutter Demo Home Page'),
                  navigateForm:(context) => MyFormPage(title: 'adff'),
                },
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
