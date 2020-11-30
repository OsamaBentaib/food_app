import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/body.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/personel/components/services/api_connection.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PersonData apiService = PersonData();
  PersonModel appbarPerson;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[100],
        body: FutureBuilder<PersonModel>(
            future: apiService.getPersondataFromSharedPref(),
            builder: (context, snapshot) {
              PersonModel data = snapshot.data;
              return Body(
                person: data,
              );
            }));
  }
}
