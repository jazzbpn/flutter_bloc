import 'package:bloc_test_1/form/MyFormBloc.dart';
import 'package:bloc_test_1/form/MyFormEvent.dart';
import 'package:bloc_test_1/form/my_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyForm extends StatefulWidget {
  MyForm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final MyFormBloc _myFormBloc = MyFormBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
          padding: EdgeInsets.all(10),
          child: BlocBuilder(
            bloc: _myFormBloc,
            builder: (BuildContext context, MyFormState state) {
              if (state.isFormSubmittedSuccessfully) {
                return SuccessDialog(onDismissed: () {
                  _emailController.clear();
                  _passwordController.clear();
                  _myFormBloc.dispatch(FormReset());
                });
              }
              return Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      autovalidate: true,
                      validator: (_) {
                        return state.isEmailValid ? null : 'Invalid email';
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      autovalidate: true,
                      validator: (_) {
                        return state.isPasswordValid
                            ? null
                            : 'Invalid password';
                      },
                    ),
                    RaisedButton(
                      onPressed: state.isFormValid ? _onSubmitPressed : null,
                      child: Text('Submit'),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  void _onEmailChanged() {
    _myFormBloc.dispatch(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _myFormBloc.dispatch(PasswordChanged(password: _passwordController.text));
  }

  void _onSubmitPressed() {
    _myFormBloc.dispatch(FormSubmitted());
  }

  @override
  void dispose() {

    _myFormBloc.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}


class SuccessDialog extends StatelessWidget {
  final VoidCallback onDismissed;

  SuccessDialog({Key key, @required this.onDismissed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(Icons.info),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Form Submitted Successfully!',
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
            child: Text('OK'),
            onPressed: onDismissed,
          ),
        ],
      ),
    );
  }
}
