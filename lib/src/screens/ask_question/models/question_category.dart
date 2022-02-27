
class QuestionCategory {
  QuestionCategory({
      int? id, 
      String? name, 
      String? description, 
      double? price, 
      List<String>? suggestions,}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _suggestions = suggestions;
}

  QuestionCategory.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _suggestions = json['suggestions'] != null ? json['suggestions'].cast<String>() : [];
  }
  int? _id;
  String? _name;
  String? _description;
  double? _price;
  List<String>? _suggestions;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  double? get price => _price;
  List<String>? get suggestions => _suggestions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['suggestions'] = _suggestions;
    return map;
  }

}