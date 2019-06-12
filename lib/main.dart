import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/Routes.dart';
import 'package:bloc_test_1/SimpleBlogDelegate.dart';
import 'package:bloc_test_1/form/widget/MyForm.dart';
import 'package:bloc_test_1/home/bloc/AddItemBloc.dart';
import 'package:bloc_test_1/home/bloc/CounterBloc.dart';
import 'package:bloc_test_1/home/bloc/ThemeBloc.dart';
import 'package:bloc_test_1/home/widget/MyHomePage.dart';
import 'package:bloc_test_1/navigation/NavWidget.dart';
import 'package:bloc_test_1/snack_bar/DataBloc.dart';
import 'package:bloc_test_1/snack_bar/ShowSnackBarWidget.dart';
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
  final DataBloc _dataBloc = DataBloc();
  
    @override
    Widget build(BuildContext context) {
      return BlocProviderTree(
          blocProviders: [
            BlocProvider<CounterBloc>(bloc: _counterBloc),
            BlocProvider<AddItemBloc>(bloc: _addItemBloc),
            BlocProvider<ThemeBloc>(bloc: _themeBloc),
            BlocProvider<DataBloc>(bloc: _dataBloc),
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
                  navigateForm:(context) => MyForm(title: 'adff'),
                  navigateSnackbar:(context) => ShowSnackbarWidget(),
                  navigateNavigator:(context) => NavWidget(),
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
