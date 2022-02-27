class BirthPlace {
  BirthPlace({
    this.placeName,
    this.placeId = '',
  });

  BirthPlace.fromJson(dynamic json) {
    placeName = json['placeName'];
    placeId = json['placeId'];
  }
  String? placeName;
  String? placeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['placeName'] = placeName;
    map['placeId'] = placeId;
    return map;
  }

}