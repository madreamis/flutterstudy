// ignore: camel_case_types
class fiveModel {
  final int total;
  final int pages;
  final int limit;
  final int page;
  final List list;

  fiveModel(
      {required this.total,
      required this.pages,
      required this.limit,
      required this.page,
      required this.list});

  factory fiveModel.fromJson(Map<String, dynamic> json) {
    return fiveModel(
      total: json['total'],
      pages: json['pages'],
      limit: json['limit'],
      page: json['page'],
      list:(json['list']  as List).map((i) => list.fromJson(i)).toList(),
    );
}

class list {
  int id;
  int userId;
  String userName;
  int colorType;
  String addTime;
  String updateTime;
  bool deleted;

  list(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.colorType,
      required this.addTime,
      required this.updateTime,
      required this.deleted});

 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['colorType'] = this.colorType;
    data['addTime'] = this.addTime;
    data['updateTime'] = this.updateTime;
    data['deleted'] = this.deleted;
    return data;
  }
}
}