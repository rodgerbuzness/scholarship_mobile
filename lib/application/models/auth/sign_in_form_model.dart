import 'package:dio/dio.dart';
import 'package:scholarship/application/classes/errors/common_error.dart';
import 'package:scholarship/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInFormModel {
  final AuthState _authState = Injector.get<AuthState>();

  String email;
  String password;

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

  Future<void> submitSignIn() async {
    return await _authState.signIn(email: this.email, password: this.password);
  }
}
