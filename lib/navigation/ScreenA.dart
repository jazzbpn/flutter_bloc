import 'package:bloc_test_1/navigation/NavBloc.dart';
import 'package:bloc_test_1/navigation/NavEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to PageB'),
          onPressed: () {
            BlocProvider.of<NavBloc>(context).dispatch(NavEvent.eventB);
          },
        ),
      ),
    );
  }
}
