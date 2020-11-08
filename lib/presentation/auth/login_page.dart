import 'package:flutter/material.dart';
import 'package:scholarship/application/models/auth/sign_in_form_model.dart';
import 'package:scholarship/router/route_constants.dart';
import 'package:scholarship/value/images.dart';
import 'package:scholarship/widgets/show_snackbar.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        inject: [Inject<SignInFormModel>(() => SignInFormModel())],
        builder: (context) {
          final _singletonSignInformModel =
              Injector.getAsReactive<SignInFormModel>();
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
                StateBuilder<SignInFormModel>(
                  builder: (context, loginFormModel) {
                    return TextFormField(
                      onChanged: (String email) {
                        print(email);
                        loginFormModel.setState(
                          (state) => state.setEmail(email),
                          catchError: true,
                        );
                      },
                      decoration: InputDecoration(
                          errorText: loginFormModel.hasError
                              ? loginFormModel.error.message
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
                StateBuilder<SignInFormModel>(
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
                StateBuilder(
                  observe: () => _singletonSignInformModel,
                  builder: (_, model) {
                    return MaterialButton(
                      onPressed: () {
                        if (!_singletonSignInformModel.state.validateData()) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text(
                                'Invalid data, kindly fill the form correctly!'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          _singletonSignInformModel.setState(
                            (signInFormState) async {
                              await signInFormState.submitSignIn();
                              Navigator.pushNamed(context, homeRoute);
                            },
                            onError: (context, error) {
                              showSnackbar(key: _key, message: error.message);
                            },
                          );
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      height: 55,
                      shape: StadiumBorder(),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                    Text("Dont have an account ?"),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, signUpRoute);
                      },
                      child: Text(
                        'Sign Up',
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
