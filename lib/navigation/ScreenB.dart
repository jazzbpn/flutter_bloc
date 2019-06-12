import 'package:bloc_test_1/navigation/NavBloc.dart';
import 'package:bloc_test_1/navigation/NavEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go to PageA'),
          onPressed: () {
            BlocProvider.of<NavBloc>(context).dispatch(NavEvent.eventA);
          },
        ),
      ),
    );
  }
}
