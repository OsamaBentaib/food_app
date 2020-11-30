import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/auth/register/register_page.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/auth/login/bloc/login_bloc.dart';
import 'package:food_app/screens/auth/login/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Login"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Container(
            padding: EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  LoginForm(
                    userRepository: userRepository,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RegisterPage(userRepository: userRepository)));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account ? ",
                              style: TextStyle(color: kTextColor),
                            ),
                            TextSpan(
                              text: " Register",
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
