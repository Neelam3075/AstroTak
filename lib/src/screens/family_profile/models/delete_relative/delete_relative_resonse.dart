
class DeleteRelativeResonse {
  DeleteRelativeResonse({
      String? httpStatus, 
      int? httpStatusCode, 
      bool? success, 
      String? message, 
      String? apiName,}){
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
}

  DeleteRelativeResonse.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
  }
  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;

  String? get httpStatus => _httpStatus;
  int? get httpStatusCode => _httpStatusCode;
  bool? get success => _success;
  String? get message => _message;
  String? get apiName => _apiName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = _httpStatus;
    map['httpStatusCode'] = _httpStatusCode;
    map['success'] = _success;
    map['message'] = _message;
    map['apiName'] = _apiName;
    return map;
  }

}