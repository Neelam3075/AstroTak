import 'relative_response_data.dart';

class RelativesResponse {
  RelativesResponse({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    RelativeResponseData? data,
  }) {
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
    _data = data;
  }

  RelativesResponse.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
    _data = json['data'] != null
        ? RelativeResponseData.fromJson(json['data'])
        : null;
  }

  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;
  RelativeResponseData? _data;

  String? get httpStatus => _httpStatus;

  int? get httpStatusCode => _httpStatusCode;

  bool? get success => _success;

  String? get message => _message;

  String? get apiName => _apiName;

  RelativeResponseData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = _httpStatus;
    map['httpStatusCode'] = _httpStatusCode;
    map['success'] = _success;
    map['message'] = _message;
    map['apiName'] = _apiName;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
