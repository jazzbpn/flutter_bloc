import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class MyFormState extends Equatable {
  final String email;
  final bool isEmailValid;
  final String password;
  final bool isPasswordValid;
  final bool isFormSubmittedSuccessfully;

  bool get isFormValid => isEmailValid && isPasswordValid;

  MyFormState(
      {@required this.email,
      @required this.isEmailValid,
      @required this.password,
      @required this.isPasswordValid,
      @required this.isFormSubmittedSuccessfully})
      : super([
          email,
          isEmailValid,
          password,
          isEmailValid,
          isFormSubmittedSuccessfully
        ]);

  factory MyFormState.initial() {
    return MyFormState(
      email: '',
      isEmailValid: false,
      password: '',
      isPasswordValid: false,
      isFormSubmittedSuccessfully: false,
    );
  }

  MyFormState copyWith({
    String email,
    bool isEmailValid,
    String password,
    bool isPasswordValid,
    bool isFormSubmittedSuccessfully,
  }) {
    return MyFormState(
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      password: password ?? this.password,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isFormSubmittedSuccessfully:
          isFormSubmittedSuccessfully ?? this.isFormSubmittedSuccessfully,
    );
  }

  @override
  String toString() {
    return '''MyFormState{
      email: $email,
      isEmailValid: $isEmailValid,
      password: $password,
      isPasswordValid: $isPasswordValid,
      isFormSubmittedSuccessfully: $isFormSubmittedSuccessfully,
    }''';
  }
}
