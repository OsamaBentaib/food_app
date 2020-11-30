class ReviewsMd {
  int id, reviewedby, rstid;
  double rate;
  String content, date;

  ReviewsMd(
      {this.id,
      this.rate,
      this.content,
      this.date,
      this.reviewedby,
      this.rstid});

  factory ReviewsMd.fromMap(Map<String, dynamic> json) => new ReviewsMd(
        id: json["id"],
        rate: json["rate"],
        rstid: json["rst_id"],
        date: json["created_at"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "rate": rate,
        "rst_id": rstid,
        "created_at": date,
        "content": content,
      };
}
