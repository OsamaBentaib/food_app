import 'dart:convert';

class Ratemodels {
  int id, ratedby, rating;
  double dinInrate, takeawayrate, deliveryrate, rate;
  Ratemodels(
      {this.id,
      this.deliveryrate,
      this.dinInrate,
      this.rate,
      this.takeawayrate,
      this.ratedby,
      this.rating});

  factory Ratemodels.fromJson(Map<String, dynamic> json) {
    return Ratemodels(
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
    return 'Ratemodels{id: $id}';
  }
}

List<Ratemodels> ratingFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Ratemodels>.from(data.map((item) => Ratemodels.fromJson(item)));
}

String ratingToJson(Ratemodels data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}