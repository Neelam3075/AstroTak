import 'birth_details.dart';
import 'birth_place.dart';

class AllRelatives {
  AllRelatives({
    String? uuid,
    String? relation,
    int? relationId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? fullName,
    String? gender,
    String? dateAndTimeOfBirth,
    BirthDetails? birthDetails,
    BirthPlace? birthPlace,
  }) {
    _uuid = uuid;
    _relation = relation;
    _relationId = relationId;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _fullName = fullName;
    _gender = gender;
    _dateAndTimeOfBirth = dateAndTimeOfBirth;
    _birthDetails = birthDetails;
    _birthPlace = birthPlace;
  }

  AllRelatives.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _relation = json['relation'];
    _relationId = json['relationId'];
    _firstName = json['firstName'];
    _middleName = json['middleName'];
    _lastName = json['lastName'];
    _fullName = json['fullName'];
    _gender = json['gender'];
    _dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    _birthDetails = json['birthDetails'] != null
        ? BirthDetails.fromJson(json['birthDetails'])
        : null;
    _birthPlace = json['birthPlace'] != null
        ? BirthPlace.fromJson(json['birthPlace'])
        : null;
  }

  String? _uuid;
  String? _relation;
  int? _relationId;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _fullName;
  String? _gender;
  String? _dateAndTimeOfBirth;
  BirthDetails? _birthDetails;
  BirthPlace? _birthPlace;

  String? get uuid => _uuid;

  String? get relation => _relation;

  int? get relationId => _relationId;

  String? get firstName => _firstName;

  String? get middleName => _middleName;

  String? get lastName => _lastName;

  String? get fullName => _fullName;

  String? get gender => _gender;

  String? get dateAndTimeOfBirth => _dateAndTimeOfBirth;

  BirthDetails? get birthDetails => _birthDetails;

  BirthPlace? get birthPlace => _birthPlace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['relation'] = _relation;
    map['relationId'] = _relationId;
    map['firstName'] = _firstName;
    map['middleName'] = _middleName;
    map['lastName'] = _lastName;
    map['fullName'] = _fullName;
    map['gender'] = _gender;
    map['dateAndTimeOfBirth'] = _dateAndTimeOfBirth;
    if (_birthDetails != null) {
      map['birthDetails'] = _birthDetails?.toJson();
    }
    if (_birthPlace != null) {
      map['birthPlace'] = _birthPlace?.toJson();
    }
    return map;
  }
}
