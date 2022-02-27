class AddMemberResponse {
  AddMemberResponse({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
  });

  AddMemberResponse.fromJson(dynamic json) {
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
    success = json['success'];
    message = json['message'];
    apiName = json['apiName'];
  }

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = httpStatus;
    map['httpStatusCode'] = httpStatusCode;
    map['success'] = success;
    map['message'] = message;
    map['apiName'] = apiName;
    return map;
  }
}
