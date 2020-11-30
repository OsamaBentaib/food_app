import 'dart:convert';

class ItemListMd {
  int id;
  String title, description, categorie, poster;
  String price, dprice;

  ItemListMd(
      {this.id,
      this.categorie,
      this.description,
      this.dprice,
      this.poster,
      this.price,
      this.title});

  factory ItemListMd.fromJson(Map<String, dynamic> map) {
    return ItemListMd(
        id: map["id"],
        title: map["title"],
        description: map["description"],
        price: map["price"],
        dprice: map["dprice"],
        categorie: map["categories"],
        poster: map["poster"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "price": price,
      "categories": categorie,
    };
  }

  @override
  String toString() {
    return 'Profile{id: $id, title: $title, description: $description, price: $price}';
  }
}

List<ItemListMd> itemListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ItemListMd>.from(data.map((item) => ItemListMd.fromJson(item)));
}

String itemListToJson(ItemListMd data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class ItemToJson {
  String title, description, categorie;
  double price, dprice;
  ItemToJson(
      {this.categorie, this.description, this.price, this.title, this.dprice});
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "price": price,
      "dprice": dprice,
      "categories": categorie,
    };
  }
}

String itemCreateToJson(ItemToJson data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
