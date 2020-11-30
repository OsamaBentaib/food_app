import 'dart:convert';

class UserLocation {
  String long, lat;
  UserLocation({this.lat, this.long});
  factory UserLocation.fromMap(Map<String, dynamic> json) =>
      new UserLocation(long: json["long"], lat: json["lat"]);
}

class Phone {
  String phone;
  bool isActivate;
  Phone({this.phone, this.isActivate});
  factory Phone.fromMap(Map<String, dynamic> json) =>
      new Phone(phone: json["phone"], isActivate: json["isActivate"]);
}

class PersonModel {
  int id, addedby;
  String name;
  Phone phone;
  UserLocation location;
  String address, city, country;

  PersonModel({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.city,
    this.country,
    this.addedby,
    this.location,
  });

  factory PersonModel.fromMap(Map<String, dynamic> json) => new PersonModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        location: UserLocation.fromMap(json["location"]),
        phone: Phone.fromMap(json["phone"]),
        city: json["city"],
        country: json["country"],
        addedby: json["addedby"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "city": city,
        "country": country,
      };
}

List<PersonModel> personFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<PersonModel>.from(data.map((item) => PersonModel.fromMap(item)));
}

String personToJson(PersonModel data) {
  final jsonData = data.toMap();
  return json.encode(jsonData);
}
