import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/auth/login/bloc/login_bloc.dart';
import 'package:food_app/screens/auth/register/register_page.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;

  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  UserRepository userRepository;
  _LoginFormState(this.userRepository);
  bool _isLoading = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoggingIn;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          setState(() {
            _isLoading = false;
          });
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Your Password Or Username is Not Correct'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(3)),
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "username",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(3)),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.all(20),
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: _isLoading
                            ? kPrimaryColor.withOpacity(.4)
                            : kPrimaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (_isLoading) {
                              print('loading');
                            } else {
                              if (_usernameController.text != "" ||
                                  _passwordController.text != "") {
                                print('Not Loading');
                                setState(() => _isLoading = true);
                                _onLoginButtonPressed();
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Please fill all fields'),
                                  backgroundColor: kPrimaryColor,
                                ));
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  _isLoading ? "LOGGING IN.." : "LOGIN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
