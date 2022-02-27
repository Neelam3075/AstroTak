class BirthDetails {
  BirthDetails({
      this.dobYear, 
      this.dobMonth, 
      this.dobDay, 
      this.tobHour, 
      this.tobMin, 
      this.meridiem = 'AM',});

  BirthDetails.fromJson(dynamic json) {
    dobYear = json['dobYear'];
    dobMonth = json['dobMonth'];
    dobDay = json['dobDay'];
    tobHour = json['tobHour'];
    tobMin = json['tobMin'];
    meridiem = json['meridiem'];
  }
  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dobYear'] = dobYear;
    map['dobMonth'] = dobMonth;
    map['dobDay'] = dobDay;
    map['tobHour'] = tobHour;
    map['tobMin'] = tobMin;
    map['meridiem'] = meridiem;
    return map;
  }

  BirthDetails copyWith({
    int? dobYear,
    int? dobMonth,
    int? dobDay,
    int? tobHour,
    int? tobMin,
    String? meridiem,
  }) {
    return BirthDetails(
      dobYear: dobYear ?? this.dobYear,
      dobMonth: dobMonth ?? this.dobMonth,
      dobDay: dobDay ?? this.dobDay,
      tobHour: tobHour ?? this.tobHour,
      tobMin: tobMin ?? this.tobMin,
      meridiem: meridiem ?? this.meridiem,
    );
  }
}