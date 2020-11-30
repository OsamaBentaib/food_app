import 'dart:convert';

class RatingMod {
  int id, ratedby, rating;
  String dinInrate, takeawayrate, deliveryrate, rate;
  RatingMod(
      {this.id,
      this.deliveryrate,
      this.dinInrate,
      this.rate,
      this.takeawayrate,
      this.ratedby,
      this.rating});

  factory RatingMod.fromJson(Map<String, dynamic> json) {
    return RatingMod(
      id: json["id"],
      ratedby: json["rated_by"],
      dinInrate: json["dinin_rate"],
      takeawayrate: json["takeaway_rate"],
      deliveryrate: json["delivery_rate"],
      rating: json["rating"],
      rate: json["rate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "rated_by": ratedby,
      "rating": rating,
      "rate": rate,
      "dinin_rate": dinInrate,
      "takeaway_rate": takeawayrate,
      "delivery_rate": deliveryrate,
    };
  }

  @override
  String toString() {
    return 'RatingMod{id: $id}';
  }
}

List<RatingMod> ratingFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<RatingMod>.from(data.map((item) => RatingMod.fromJson(item)));
}

String ratingToJson(RatingMod data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
