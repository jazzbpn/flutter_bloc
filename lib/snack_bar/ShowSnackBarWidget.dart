import 'package:bloc_test_1/snack_bar/DataBloc.dart';
import 'package:bloc_test_1/snack_bar/DataEvent.dart';
import 'package:bloc_test_1/snack_bar/DataState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSnackbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataBloc _dataBloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Show snackbar"),
      ),
      body: BlocListener(
        bloc: _dataBloc,
        listener: (BuildContext context, DataState state) {
          if (state is Success) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
          }
        },
        child: BlocBuilder(
          bloc: _dataBloc,
          builder: (BuildContext context, DataState state) {
            if (state is Initial) {
              return Center(child: Text('Press the Button'));
            }

            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is Success) {
              return Center(child: Text('Success'));
            }
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              _dataBloc.dispatch(FetchData());
            },
          ),
        ],
      ),
    );
  }
}
