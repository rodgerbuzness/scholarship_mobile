import 'package:flutter/material.dart';
import 'package:scholarship/router/route_constants.dart';
import 'package:scholarship/value/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:scholarship/application/models/auth/sign_up_form_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: Injector(
        inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
        builder: (context) {
          final _singletonSignUpFormModel =
              Injector.getAsReactive<SignUpFormModel>();
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Container(
                  height: 250,
                  child: Center(
                    child: Image.asset(Images.logo),
                  ),
                ),
                StateBuilder<SignUpFormModel>(
                  builder: (context, registerFormModel) {
                    return TextFormField(
                      onChanged: (String firstName) {
                        registerFormModel.setState(
                          (state) => state.setFirstName(firstName),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                          errorText: registerFormModel.hasError
                              ? registerFormModel.error.message
                              : null,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          hintText: "Enter your first name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (context, registerFormModel) {
                    return TextFormField(
                      onChanged: (String lastName) {
                        registerFormModel.setState(
                          (state) => state.setLastName(lastName),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                          errorText: registerFormModel.hasError
                              ? registerFormModel.error.message
                              : null,
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                          hintText: "Enter your last name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (context, registerFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        registerFormModel.setState(
                          (state) => state.setEmail(email),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                          errorText: registerFormModel.hasError
                              ? registerFormModel.error.message
                              : null,
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          hintText: "Enter your email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        signFormModel.setState(
                          (state) => state.setPassword(password),
                          catchError: true,
                        );
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          errorText: signFormModel.hasError
                              ? signFormModel.error.message
                              : null,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder<SignUpFormModel>(
                  builder: (_, signFormModel) {
                    return TextFormField(
                      onChanged: (String password) {
                        signFormModel.setState(
                          (state) => state.setPasswordConfirmation(password),
                          catchError: true,
                        );
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          errorText: signFormModel.hasError
                              ? signFormModel.error.message
                              : null,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          hintText: 'Enter your password confirmation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    );
                  },
                ),
                buildSizedBox(15),
                StateBuilder(
                  observe: () => _singletonSignUpFormModel,
                  builder: (_, model) {
                    return MaterialButton(
                      onPressed: () {
                        if (!_singletonSignUpFormModel.state.validateData()) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text(
                                'Invalid data, kindly fill the form correctly!'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          _singletonSignUpFormModel.setState(
                              (signInFormState) =>
                                  signInFormState.SubmitSignUp());
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      height: 55,
                      shape: StadiumBorder(),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                buildSizedBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("already have an account ?"),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signInRoute);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
