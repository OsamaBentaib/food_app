import 'package:flutter/material.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/personel/screens/home/components/app_bar.dart';
import 'package:food_app/screens/app/personel/screens/home/components/body.dart';
import 'package:food_app/screens/app/personel/components/services/api_connection.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersonData apiService = PersonData();
  bool isLoaded = false;

  void initState() {
    super.initState();
    apiService.getPersondata().then((value) {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Colors.grey[100],
      body: isLoaded
          ? FutureBuilder<PersonModel>(
              future: apiService.getPersondataFromSharedPref(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PersonModel data = snapshot.data;
                  return Body(
                    person: data,
                  );
                } else {
                  print(snapshot.error);
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })
          : FutureBuilder<PersonModel>(
              future: apiService.getPersondataFromSharedPref(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    PersonModel data = snapshot.data;
                    return Body(
                      person: data,
                    );
                  } else {
                    print(snapshot.error);
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text("Couldn't refresh data"),
      ),
    );
  }
}
