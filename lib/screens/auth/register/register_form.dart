import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/edit_profile.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/edit_profile.dart';
import 'package:food_app/screens/auth/register/bloc/register_bloc.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';

class Message {
  final String message;
  Message([this.message = ""]);
}

class Errors {
  Message username;
  Message email;
  Message password;
  Errors({this.email, this.password, this.username});
  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      username: Message(json["username"]),
      email: Message(json["email"]),
      password: Message(json["password"]),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;

  RegisterForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);
  @override
  State<RegisterForm> createState() => _RegisterFormState(userRepository);
}

class _RegisterFormState extends State<RegisterForm> {
  UserRepository userRepository;
  _RegisterFormState(this.userRepository);
  bool _isLoading = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  int account;

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      BlocProvider.of<RegisterBloc>(context).add(RegisterButtonPressed(
        account: account,
        username: _usernameController.text,
        email: _emailController.text,
        password1: _password1Controller.text,
        password2: _password1Controller.text,
      ));
    }

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFaliure) {
          setState(() => _isLoading = false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
            duration: Duration(minutes: 5),
          ));
        } else if (state is RegisterSuccess) {
          setState(() => _isLoading = false);
          if (account == 0) {
            print("Register Success");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => PersonEditProfile()));
          } else {
            print("Register Success");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => RestaurantEditProfile()));
          }
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Select Account type",
                      style: TextStyle(
                          fontSize: 19,
                          color: kTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 10, bottom: 0),
                      child: ListTile(
                        title: Text(
                          'Personal',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        leading: Radio(
                          activeColor: kPrimaryColor,
                          value: 0,
                          groupValue: account,
                          onChanged: (value) {
                            setState(() {
                              account = value;
                              print(value);
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 10, bottom: 0),
                      child: ListTile(
                        title: Text(
                          "Register your Restaurant",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kTextColor),
                        ),
                        leading: Radio(
                          activeColor: kPrimaryColor,
                          value: 1,
                          groupValue: account,
                          onChanged: (value) {
                            setState(() {
                              account = value;
                              print(value);
                            });
                          },
                        ),
                      ),
                    ),
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
                            hintText: "Username",
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
                        controller: _emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email Address",
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
                        controller: _password1Controller,
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
                            } else {
                              if (account != null) {
                                if (_usernameController.text != null ||
                                    _emailController.text != null ||
                                    _password1Controller.text != null) {
                                  setState(() => _isLoading = true);
                                  _onRegisterButtonPressed();
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Please fill all fields'),
                                    backgroundColor: kPrimaryColor,
                                  ));
                                }
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Please Select account type'),
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
                                Text(
                                  _isLoading ? "REGISTRING.." : "REGISTER",
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
