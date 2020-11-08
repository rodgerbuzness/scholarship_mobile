import 'package:scholarship/application/classes/errors/common_error.dart';
import 'package:scholarship/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  void setFirstName(String firstName) {
    // check the email validaion

    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    // check the email validaion

    this.lastName = lastName;
  }

  void setEmail(String email) {
    // check the email validaion

    if (!validateEmail(email)) {
      throw CommonError(message: "Invalid email");
    }
    this.email = email;
  }

  void setPassword(String password) {
    if (password.length < 6) {
      throw CommonError(
          message: "Password length must be more than 6 characters!");
    }
    this.password = password;
  }

  void setPasswordConfirmation(String passwordConfirmation) {
    if (this.password != passwordConfirmation) {
      throw CommonError(message: "Password does not match");
    }

    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(email);
  }

  SubmitSignUp() async {
    await _authState.signUp(
      firstName: firstName,
      lastName: lastName,
      email: this.email,
      password: this.password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
