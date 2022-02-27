import 'question_category.dart';

class CategoryResponse {
  CategoryResponse({
    String? httpStatus,
    int? httpStatusCode,
    bool? success,
    String? message,
    String? apiName,
    List<QuestionCategory>? queCategoryList,
  }) {
    _httpStatus = httpStatus;
    _httpStatusCode = httpStatusCode;
    _success = success;
    _message = message;
    _apiName = apiName;
    _data = queCategoryList;
  }

  CategoryResponse.fromJson(dynamic json) {
    _httpStatus = json['httpStatus'];
    _httpStatusCode = json['httpStatusCode'];
    _success = json['success'];
    _message = json['message'];
    _apiName = json['apiName'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(QuestionCategory.fromJson(v));
      });
    }
  }

  String? _httpStatus;
  int? _httpStatusCode;
  bool? _success;
  String? _message;
  String? _apiName;
  List<QuestionCategory>? _data;

  String? get httpStatus => _httpStatus;

  int? get httpStatusCode => _httpStatusCode;

  bool? get success => _success;

  String? get message => _message;

  String? get apiName => _apiName;

  List<QuestionCategory>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['httpStatus'] = _httpStatus;
    map['httpStatusCode'] = _httpStatusCode;
    map['success'] = _success;
    map['message'] = _message;
    map['apiName'] = _apiName;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
