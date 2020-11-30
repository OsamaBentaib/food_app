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
        isDelivery: json["isDelevery"],
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

class ServiceOfferToInt {
  int rstid;
  int isDelivery, isTakeaway, isDinIn, isNcDelivery;

  ServiceOfferToInt(
      {this.isDelivery,
      this.isDinIn,
      this.isTakeaway,
      this.rstid,
      this.isNcDelivery});

  factory ServiceOfferToInt.fromMap(Map<String, dynamic> json) =>
      new ServiceOfferToInt(
        rstid: json["rst_id"],
        isDelivery: json["isDelevery"],
        isTakeaway: json["isTakeaway"],
        isDinIn: json["isDinIn"],
        isNcDelivery: json["isNcDelivery"],
      );

  Map<String, dynamic> toMap() => {
        "rst_id": rstid,
        "isDelivery": isDelivery,
        "isTakeaway": isTakeaway,
        "isDinIn": isDinIn,
        "isNcDelivery": isNcDelivery,
      };
}
