import 'all_relatives.dart';

class RelativeResponseData {
  RelativeResponseData({
    int? pageNo,
    int? numberOfElements,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    List<AllRelatives>? allRelatives,
  }) {
    _pageNo = pageNo;
    _numberOfElements = numberOfElements;
    _pageSize = pageSize;
    _totalElements = totalElements;
    _totalPages = totalPages;
    _allRelatives = allRelatives;
  }

  RelativeResponseData.fromJson(dynamic json) {
    _pageNo = json['pageNo'];
    _numberOfElements = json['numberOfElements'];
    _pageSize = json['pageSize'];
    _totalElements = json['totalElements'];
    _totalPages = json['totalPages'];
    if (json['allRelatives'] != null) {
      _allRelatives = [];
      json['allRelatives'].forEach((v) {
        _allRelatives?.add(AllRelatives.fromJson(v));
      });
    }
  }

  int? _pageNo;
  int? _numberOfElements;
  int? _pageSize;
  int? _totalElements;
  int? _totalPages;
  List<AllRelatives>? _allRelatives;

  int? get pageNo => _pageNo;

  int? get numberOfElements => _numberOfElements;

  int? get pageSize => _pageSize;

  int? get totalElements => _totalElements;

  int? get totalPages => _totalPages;

  List<AllRelatives>? get allRelatives => _allRelatives;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNo'] = _pageNo;
    map['numberOfElements'] = _numberOfElements;
    map['pageSize'] = _pageSize;
    map['totalElements'] = _totalElements;
    map['totalPages'] = _totalPages;
    if (_allRelatives != null) {
      map['allRelatives'] = _allRelatives?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
