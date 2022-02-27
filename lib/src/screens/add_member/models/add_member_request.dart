import 'birth_details.dart';
import 'birth_place.dart';

class AddMemberRequest {
  AddMemberRequest({
    this.uuid,
    this.relationId = 2,
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.fullName,
    this.gender = 'FEMALE',
    this.dateAndTimeOfBirth = '',
    this.birthDetails,
    this.birthPlace,
  });

  AddMemberRequest.fromJson(dynamic json) {
    /*  uuid = json['uuid'];*/
    relationId = json['relationId'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    gender = json['gender'];
    dateAndTimeOfBirth = json['dateAndTimeOfBirth'];
    birthDetails = json['birthDetails'] != null ? BirthDetails.fromJson(json['birthDetails']) : null;
    birthPlace = json['birthPlace'] != null ? BirthPlace.fromJson(json['birthPlace']) : null;
  }
  String? uuid;
  int? relationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    /* map['uuid'] = uuid;*/
    map['relationId'] = relationId;
    map['firstName'] = firstName;
    map['middleName'] = middleName;
    map['lastName'] = lastName;
    map['fullName'] = fullName;
    map['gender'] = gender;
    map['dateAndTimeOfBirth'] = dateAndTimeOfBirth;
    if (birthDetails != null) {
      map['birthDetails'] = birthDetails?.toJson();
    }
    if (birthPlace != null) {
      map['birthPlace'] = birthPlace?.toJson();
    }
    return map;
  }

  AddMemberRequest copyWith({
    String? uuid,
    int? relationId,
    String? firstName,
    dynamic? middleName,
    String? lastName,
    String? fullName,
    String? gender,
    String? dateAndTimeOfBirth,
    BirthDetails? birthDetails,
    BirthPlace? birthPlace,
  }) {
    return AddMemberRequest(
      /* uuid: uuid ?? this.uuid,*/
      relationId: relationId ?? this.relationId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      dateAndTimeOfBirth: dateAndTimeOfBirth ?? this.dateAndTimeOfBirth,
      birthDetails: birthDetails ?? this.birthDetails,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }
}