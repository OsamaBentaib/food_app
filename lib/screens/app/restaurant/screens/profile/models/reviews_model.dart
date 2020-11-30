import 'dart:convert';

class ReviewsMd {
  final int id;
  final int reviewedby, rstid;
  final String content, date;
  final String rate;

  ReviewsMd({
    this.id,
    this.reviewedby,
    this.content,
    this.date,
    this.rate,
    this.rstid,
  });

  factory ReviewsMd.fromJson(Map<String, dynamic> json) {
    return ReviewsMd(
      reviewedby: json['reviewed_by'] as int,
      id: json['id'] as int,
      rstid: json['rst_id'] as int,
      content: json['content'] as String,
      date: json['created_at'] as String,
      rate: json['rate'] as String,
    );
  }
}

List<ReviewsMd> reviewsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<ReviewsMd>.from(data.map((item) => ReviewsMd.fromJson(item)));
}
