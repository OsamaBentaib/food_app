import 'package:food_app/screens/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/auth/login/login_page.dart';

class Welcom extends StatelessWidget {
  final userRepository;
  const Welcom({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcom"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage(
                        userRepository: userRepository
                      );
                    },
                  ),
                );
              },
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage(
                        userRepository: userRepository,
                      );
                    },
                  ),
                );
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}