import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/personel/screens/settings/services/services.dart';
import 'package:food_app/screens/app/ref.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/models/api_models.dart';
import 'package:food_app/screens/auth/dao/user_dao.dart';
import 'package:http/http.dart' as http;

final userDao = UserDao();

// ignore: must_be_immutable
class PersonCitiesEdit extends StatefulWidget {
  PersonModel profile;
  bool register;
  int id;
  PersonCitiesEdit({this.register, this.id, this.profile});
  @override
  _PersonCitiesEditState createState() =>
      _PersonCitiesEditState(register, id, profile);
}

class _PersonCitiesEditState extends State<PersonCitiesEdit> {
  bool register;
  int id;
  PersonModel profile;
  _PersonCitiesEditState(this.register, this.id, this.profile);
  APIProfile _apiService = APIProfile();
  List<Cities> _citites = List<Cities>();
  List<Cities> _cititesForDisplay = List<Cities>();
  TextEditingController _search = TextEditingController();

  Future<List<Cities>> fetchcitites() async {
    var url = baseURL + 'api/lists/cities/';
    print(url);
    var user = await userDao.getUserWithId(0);
    final String token = user.token;
    var response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Token $token',
      },
    );

    var citites = List<Cities>();
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      var cititesJson = json.decode(response.body);
      for (var cititeJson in cititesJson) {
        citites.add(Cities.fromJson(cititeJson));
      }
    }
    return citites;
  }

  @override
  void initState() {
    
    fetchcitites().then((value) {
      print("CONNECT>>>>>>");
      setState(() {
        _citites.addAll(value);
        _cititesForDisplay = _citites;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (_citites != null) {
            return index == 0 ? _searchBar() : _listItem(index - 1);
          }
          return Container(child: CircularProgressIndicator());
        },
        itemCount: _cititesForDisplay.length + 1,
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 7),
        decoration: BoxDecoration(
            color: Color.fromRGBO(244, 243, 243, 1),
            borderRadius: BorderRadius.circular(3)),
        child: TextField(
          controller: _search,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Start typing city",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              _cititesForDisplay = _citites.where((citite) {
                var cititeTitle = citite.title.toLowerCase();
                return cititeTitle.contains(text);
              }).toList();
            });
          },
        ),
      ),
    );
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        final data = <String, String>{
          "city": _cititesForDisplay[index].title,
          "country": _cititesForDisplay[index].text
        };
        _apiService.updatePersoneAccount(data, id).then((value) {
          if (register == true) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyStatefulWidget(
                      ref: 0,
                    )));
          } else {
            Navigator.pop(context);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: _cititesForDisplay[index].title,
                style: TextStyle(color: kTextColor),
              ),
              TextSpan(
                text: " | ",
                style: TextStyle(color: kTextColor),
              ),
              TextSpan(
                text: _cititesForDisplay[index].text,
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
