// ignore: camel_case_types
class fiveModel {
  final int total;
  final int pages;
  final int limit;
  final int page;
  List list;
  fiveModel({
    required this.total,
    required this.pages,
    required this.limit,
    required this.page,
    required this.list,
  });
  factory fiveModel.fromJson(Map<String, dynamic> json) {
    return fiveModel(
      total: json['total'],
      pages: json['pages'],
      limit: json['limit'],
      page: json['page'],
      list: (json['list'] as List).map((i) => Comment.fromJson(i)).toList(),
    );
  }
}

class Comment {
  final int id;
  final int userId;
  final String userName;
  final int colorType;
  final String addTime;
  final String updateTime;
  final bool deleted;
  Comment({
    required this.id,
    required this.userId,
    required this.userName,
    required this.colorType,
    required this.addTime,
    required this.updateTime,
    required this.deleted,
  });
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id'],
        userId: json['userId'],
        userName: json['userName'],
        colorType: json['colorType'],
        addTime: json['addTime'],
        updateTime: json['updateTime'],
        deleted: json['deleted']);
  }
}
