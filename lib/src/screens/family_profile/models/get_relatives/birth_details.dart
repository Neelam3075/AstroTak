class BirthDetails {
  BirthDetails({
    int? dobYear,
    int? dobMonth,
    int? dobDay,
    int? tobHour,
    int? tobMin,
    String? meridiem,
  }) {
    _dobYear = dobYear;
    _dobMonth = dobMonth;
    _dobDay = dobDay;
    _tobHour = tobHour;
    _tobMin = tobMin;
    _meridiem = meridiem;
  }

  BirthDetails.fromJson(dynamic json) {
    _dobYear = json['dobYear'];
    _dobMonth = json['dobMonth'];
    _dobDay = json['dobDay'];
    _tobHour = json['tobHour'];
    _tobMin = json['tobMin'];
    _meridiem = json['meridiem'];
  }

  int? _dobYear;
  int? _dobMonth;
  int? _dobDay;
  int? _tobHour;
  int? _tobMin;
  String? _meridiem;

  int? get dobYear => _dobYear;

  int? get dobMonth => _dobMonth;

  int? get dobDay => _dobDay;

  int? get tobHour => _tobHour;

  int? get tobMin => _tobMin;

  String? get meridiem => _meridiem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dobYear'] = _dobYear;
    map['dobMonth'] = _dobMonth;
    map['dobDay'] = _dobDay;
    map['tobHour'] = _tobHour;
    map['tobMin'] = _tobMin;
    map['meridiem'] = _meridiem;
    return map;
  }
}
