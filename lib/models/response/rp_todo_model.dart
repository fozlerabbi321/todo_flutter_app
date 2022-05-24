class RpTodoModel {
  RpTodoModel({
      int? id, 
      int? isComplete, 
      String? title, 
      String? description, 
      String? dateTime,}){
    _id = id;
    _isComplete = isComplete;
    _title = title;
    _description = description;
    _dateTime = dateTime;
}

  RpTodoModel.fromJson(dynamic json) {
    _id = json['id'];
    _isComplete = json['is_complete'];
    _title = json['title'];
    _description = json['description'];
    _dateTime = json['date_time'];
  }
  int? _id;
  int? _isComplete;
  String? _title;
  String? _description;
  String? _dateTime;

  int? get id => _id;
  int? get isComplete => _isComplete;
  String? get title => _title;
  String? get description => _description;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['is_complete'] = _isComplete;
    map['title'] = _title;
    map['description'] = _description;
    map['date_time'] = _dateTime;
    return map;
  }

}