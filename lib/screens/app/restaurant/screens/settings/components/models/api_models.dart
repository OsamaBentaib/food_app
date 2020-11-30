import 'dart:convert';

import 'package:meta/meta.dart';

class Restaurant {
  int id;
  String name;
  String address;
  String bio;
  String location;
  String categorie;
  String website, avatar, phone;

  Restaurant(
      {this.id = 0,
      this.name,
      this.address,
      this.avatar,
      this.bio,
      this.categorie,
      this.location,
      this.phone,
      this.website});

  factory Restaurant.fromJson(Map<String, dynamic> map) {
    return Restaurant(
      id: map["id"],
      name: map["name"],
      address: map["address"],
      location: map["location"],
      avatar: map["avatar"],
      bio: map["bio"],
      categorie: map["Categorie"],
      phone: map["phone"],
      website: map["website"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "avatar": avatar,
      "bio": bio,
      "Categorie": categorie,
      "phone": phone,
      "website": website
    };
  }

  @override
  String toString() {
    return 'Restaurant{id: $id, name: $name, email: $address, age: $bio}';
  }
}

List<Restaurant> restaurantFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Restaurant>.from(data.map((item) => Restaurant.fromJson(item)));
}

String restaurantToJson(Restaurant data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class ServicesType {
  int id;
  String service;

  ServicesType({this.id, this.service});

  factory ServicesType.fromJson(Map<String, dynamic> map) {
    return ServicesType(id: map["id"], service: map["service"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "service": service,
    };
  }

  @override
  String toString() {
    return 'service{id: $id, service: $service}';
  }
}

List<ServicesType> serviceFromJson(String jsonData) {
  final data = json.decode(jsonData);
  print("from Model");
  print(data);
  return List<ServicesType>.from(
      data.map((item) => ServicesType.fromJson(item)));
}

String serviceToJson(ServicesType data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class ServicesLists {
  final int id;
  final String service;

  ServicesLists({
    @required this.id,
    @required this.service,
  });

  factory ServicesLists.fromJson(Map<String, dynamic> json) {
    return ServicesLists(
      id: json['id'] as int,
      service: json['service'] as String,
    );
  }
  // factory ServicesLists.toJson(Map<String, dynamic> json) {
  //   return {
  //     "id": id,
  //     service: json['service'] as String,
  //   };
  // }
}

class Cities {
  String title;
  String text;

  Cities(this.title, this.text);

  Cities.fromJson(Map<String, dynamic> json) {
    title = json['name'];
    text = json['country'];
  }
}
