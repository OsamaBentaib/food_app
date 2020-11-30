import 'dart:convert';

class ServiceOffer {
  int id, rstid;
  bool isDelivery, isTakeaway, isDinIn, isNcDelivery;

  ServiceOffer(
      {this.id,
      this.isDelivery,
      this.isDinIn,
      this.isTakeaway,
      this.rstid,
      this.isNcDelivery});

  factory ServiceOffer.fromMap(Map<String, dynamic> json) => new ServiceOffer(
        id: json["id"],
        rstid: json["rst_id"],
        isDelivery: json["isDelivery"],
        isTakeaway: json["isTakeaway"],
        isDinIn: json["isDinIn"],
        isNcDelivery: json["isNcDelivery"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "rst_id": rstid,
        "isDelivery": isDelivery,
        "isTakeaway": isTakeaway,
        "isDinIn": isDinIn,
        "isNcDelivery": isNcDelivery,
      };
}

class Location {
  String long, lat;
  Location({this.lat, this.long});
  factory Location.fromMap(Map<String, dynamic> json) =>
      new Location(long: json["long"], lat: json["lat"]);
}

class RestaurantProfileModel {
  int id, addedby, score;
  String name;
  String address;
  String bio;
  String categorie;
  String website, avatar, phone, service, city, country;
  ServiceOffer serviceOffer;
  bool isVerified, status;
  Location location;

  RestaurantProfileModel(
      {this.id,
      this.name,
      this.address,
      this.avatar,
      this.bio,
      this.categorie,
      this.phone,
      this.website,
      this.city,
      this.country,
      this.service,
      this.addedby,
      this.serviceOffer,
      this.isVerified,
      this.status,
      this.location,
      this.score});

  factory RestaurantProfileModel.fromMap(Map<String, dynamic> json) =>
      new RestaurantProfileModel(
          id: json["id"],
          score: json["score"],
          name: json["name"],
          address: json["address"],
          avatar: json["avatar"],
          bio: json["bio"],
          categorie: json["Categorie"],
          phone: json["phone"],
          website: json["website"],
          service: json["Service"],
          city: json["city"],
          country: json["country"],
          addedby: json["addedby"],
          serviceOffer: ServiceOffer.fromMap(json["serviceOffer"]),
          isVerified: json['isVirefied'],
          status: json['status'],
          location: Location.fromMap(json['location']));

  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
        "avatar": avatar,
        "bio": bio,
        "score": score,
        "Categorie": categorie,
        "phone": phone,
        "website": website,
        "addedby": addedby,
        "Service": service,
        "city": city,
        "country": country,
        "isVirefied": isVerified,
      };
}

List<RestaurantProfileModel> restaurantItemsListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<RestaurantProfileModel>.from(
      data.map((item) => RestaurantProfileModel.fromMap(item)));
}

String restaurantItemsListToJson(RestaurantProfileModel data) {
  final jsonData = data.toMap();
  return json.encode(jsonData);
}
