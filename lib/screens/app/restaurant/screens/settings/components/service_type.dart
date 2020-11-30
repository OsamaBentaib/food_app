import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/app/personel/components/models/person_models.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/api_connection/api_connection.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/location.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/components/models/api_models.dart';

class ServiceType extends StatefulWidget {
  ServiceType({Key key}) : super(key: key);

  @override
  _ServiceTypeState createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  STApiService serviceApi = STApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "Restaurant Type",
                style: TextStyle(color: kTextColor),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: serviceApi.getServicesList(),
        builder: (BuildContext context,
            AsyncSnapshot<List<ServicesLists>> snapshot) {
          if (snapshot.hasData) {
            List<ServicesLists> posts = snapshot.data;
            return Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: posts
                    .map(
                      (ServicesLists post) => InkWell(
                        hoverColor: Colors.grey[200],
                        onTap: () {
                          serviceApi
                              .updateServicestype(post.service)
                              .then((value) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        RestaurantLocationEdit()));
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colors.grey[200]),
                                top: BorderSide(
                                    width: 1, color: Colors.grey[200]),
                                left: BorderSide(
                                    width: 1, color: Colors.grey[200]),
                                right: BorderSide(
                                    width: 1, color: Colors.grey[200]),
                              )),
                          child: ListTile(
                            title: Text(
                              post.service,
                              style: TextStyle(),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
