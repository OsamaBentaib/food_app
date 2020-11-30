import 'dart:convert';

import 'package:food_app/screens/app/personel/components/models/person_models.dart';

class From {
  int id;
  String name;
  From({this.id, this.name});
  factory From.fromJson(Map<String, dynamic> map) {
    return From(
      id: map["id"],
      name: map["name"],
    );
  }
}

class OrderItem {
  int id;
  String title, price, dprice, poster;
  OrderItem({this.id, this.title, this.dprice, this.poster, this.price});
  factory OrderItem.fromJson(Map<String, dynamic> map) {
    return OrderItem(
      id: map["id"],
      title: map["title"],
      price: map["price"],
      dprice: map["dprice"],
      poster: map["poster"],
    );
  }
}

class Item {
  int id, quantity;
  OrderItem orderitem;
  Item({this.id, this.orderitem, this.quantity});
  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      orderitem: OrderItem.fromJson(map["order_item"]),
      quantity: map['quantity'],
    );
  }
}

List<Item> itemListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Item>.from(data.map((item) => Orders.fromJson(item)));
}

class Orders {
  int id, byid;
  PersonModel by;
  From from;
  String type, time, status;
  List<Item> item;
  Orders(
      {this.id,
      this.type,
      this.time,
      this.status,
      this.item,
      this.by,
      this.byid,
      this.from});

  factory Orders.fromJson(Map<String, dynamic> map) {
    var items = map['items'] as List;
    List<Item> itemList = items.map((e) => Item.fromJson(e)).toList();
    return Orders(
      id: map["id"],
      by: PersonModel.fromMap(map['ordered_by_name']),
      from: From.fromJson(map['ordered_from']),
      type: map["order_type"],
      time: map["order_time"],
      status: map["order_status"],
      item: itemList,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "order_type": type,
      "order_time": time,
      "order_status": status,
    };
  }

  @override
  String toString() {
    return 'Profile{id: $id}';
  }
}

List<Orders> ordersListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Orders>.from(data.map((item) => Orders.fromJson(item)));
}

String ordersListToJson(Orders data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
