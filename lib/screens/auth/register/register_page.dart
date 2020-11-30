import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/auth/login/login_page.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';

import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/auth/register/bloc/register_bloc.dart';
import 'package:food_app/screens/auth/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  final UserRepository userRepository;

  RegisterPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Register"),
        centerTitle: true,
      ),
      body: BlocProvider(
          create: (context) {
            return RegisterBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: Container(
              padding: EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RegisterForm(userRepository: userRepository,),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => LoginPage(
                                      userRepository: userRepository)));
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account ? ",
                                style: TextStyle(color: kTextColor),
                              ),
                              TextSpan(
                                text: " Login",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
