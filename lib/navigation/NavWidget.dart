import 'package:bloc_test_1/navigation/NavBloc.dart';
import 'package:bloc_test_1/navigation/NavEvent.dart';
import 'package:bloc_test_1/navigation/NavState.dart';
import 'package:bloc_test_1/navigation/ScreenA.dart';
import 'package:bloc_test_1/navigation/ScreenB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavBloc _navBloc = NavBloc();
    return BlocProvider<NavBloc>(
      bloc: _navBloc,
      child: MaterialApp(
        home: BlocBuilder<NavEvent, NavState>(
          bloc: _navBloc,
          builder: (BuildContext context, NavState state) {
            if (state is StateA) {
              return ScreenA();
            }
            if (state is StateB) {
              return ScreenB();
            }
          },
        ),
      ),
    );
  }
}
