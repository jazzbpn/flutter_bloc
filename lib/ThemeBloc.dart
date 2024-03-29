import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeEvent{toggle}

class ThemeBloc extends Bloc<ThemeEvent , ThemeData>{
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async*{
    switch (event) {
      case ThemeEvent.toggle:
        yield currentState == ThemeData.light()?ThemeData.dark():ThemeData.light();
        break;
    }
  }
  
}