import 'package:bloc/bloc.dart';
import './bloc.dart';


class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  @override
  MyFormState get initialState => MyFormState.initial();

  @override
  Stream<MyFormState> mapEventToState(MyFormEvent event) async* {
    if (event is EmailChanged) {
      yield currentState.copyWith(
          email: event.email, isEmailValid: _isEmailValid(event.email));
    }

    if (event is PasswordChanged) {
      yield currentState.copyWith(
          password: event.password,
          isPasswordValid: _isPasswordValid(event.password));
    }

    if (event is FormReset) {
      yield MyFormState.initial();
    }

    if (event is FormSubmitted) {
      yield currentState.copyWith(isFormSubmittedSuccessfully: true);
    }
  }

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
