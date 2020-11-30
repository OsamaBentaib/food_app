import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class PersonelInfo extends StatelessWidget {
  const PersonelInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(height: 11),
                  TextField(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: '  Restaurant Name',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: '  About',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: '  Address',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: '  Phone',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  TextField(
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: '  Website',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[200], width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 11),
                  Container(
                    // padding: EdgeInsets.all(20),
                    width: double.infinity,
                    // it will cover 80% of total width
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Save Changes",
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
                ]))));
  }
}
