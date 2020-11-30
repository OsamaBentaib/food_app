class ID {
  int id;
  ID({this.id});
  factory ID.fromJson(Map<String, dynamic> json) {
    return ID(id: json['id']);
  }
}
