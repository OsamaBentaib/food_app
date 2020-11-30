import 'dart:convert';

class IntG {
  int id;
  String title;
  String poster;
  IntG({this.title, this.poster, this.id});
  factory IntG.fromJson(Map<String, dynamic> json) => new IntG(
        id: json['id'],
        title: json["title"],
        poster: json["poster"],
      );
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "poster": poster,
    };
  }
}

List<IntG> intGFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<IntG>.from(data.map((item) => IntG.fromJson(item)));
}

String intGToJson(IntG data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

class SF {
  bool isDelivery, isTakeaway, isDinIn, isNcDelivery;

  SF({this.isDelivery, this.isDinIn, this.isTakeaway, this.isNcDelivery});

  factory SF.fromMap(Map<String, dynamic> json) => new SF(
        isDelivery: json["isDelivery"],
        isTakeaway: json["isTakeaway"],
        isDinIn: json["isDinIn"],
        isNcDelivery: json["isNcDelivery"],
      );
}

class Rest {
  int id;
  String name, service;
  bool isvirified;
  SF sof;
  Rest({this.name, this.service, this.isvirified, this.sof, this.id});

  factory Rest.fromMap(Map<String, dynamic> json) => new Rest(
        id: json["id"],
        name: json["name"],
        service: json["Service"],
        isvirified: json["isVirefied"],
        sof: SF.fromMap(json["serviceOffer"]),
      );
}

class MenuItemsListMd {
  int id;
  Rest rstid;
  String title, description, poster, categories;
  String price, dprice;
  MenuItemsListMd({
    this.id,
    this.categories,
    this.description,
    this.dprice,
    this.poster,
    this.price,
    this.title,
    this.rstid,
  });

  factory MenuItemsListMd.fromJson(Map<String, dynamic> map) {
    return MenuItemsListMd(
      id: map["id"],
      rstid: Rest.fromMap(map["rst_id"]),
      title: map["title"],
      description: map["description"],
      price: map["price"],
      dprice: map["dprice"],
      categories: map["categories"],
      poster: map["poster"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rst_id": rstid,
      "title": title,
      "description": description,
      "price": price,
      "dprice": dprice,
      "categories": categories,
      "poster": poster
    };
  }

  @override
  String toString() {
    return 'MenuItemsListMd{id: $id}';
  }
}

List<MenuItemsListMd> itemListsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<MenuItemsListMd>.from(
      data.map((item) => MenuItemsListMd.fromJson(item)));
}

String itemListsToJson(MenuItemsListMd data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
