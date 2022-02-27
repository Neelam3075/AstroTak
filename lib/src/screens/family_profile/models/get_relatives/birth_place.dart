class BirthPlace {
  BirthPlace({
    String? placeName,
    String? placeId,
  }) {
    _placeName = placeName;
    _placeId = placeId;
  }

  BirthPlace.fromJson(dynamic json) {
    _placeName = json['placeName'];
    _placeId = json['placeId'];
  }

  String? _placeName;
  String? _placeId;

  String? get placeName => _placeName;

  String? get placeId => _placeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['placeName'] = _placeName;
    map['placeId'] = _placeId;
    return map;
  }
}
