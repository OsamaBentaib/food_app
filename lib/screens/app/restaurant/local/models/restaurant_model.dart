class RestaurantForDB {
  int id, addedby;
  String name;
  String address;
  String bio;
  String categorie;
  String website, avatar, phone, service, city, country;

  RestaurantForDB(
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
      this.addedby});

  factory RestaurantForDB.fromMap(Map<String, dynamic> json) =>
      new RestaurantForDB(
        id: json["id"],
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
        addedby: json["added_by"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "avatar": avatar,
        "bio": bio,
        "Categorie": categorie,
        "phone": phone,
        "website": website,
        "added_by": addedby,
        "Service": service,
        "city": city,
        "country": country,
      };
}
