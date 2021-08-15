// ignore: camel_case_types
class fiveModel {
  late final int total;
  late final int pages;
  late final int limit;
  late final int page;
  late final List<Comment> list;

  fiveModel.fromMap(Map<String, dynamic> json) {
    this.total = json['total'];
    this.pages = json['pages'];
    this.limit = json['limit'];
    this.page = json['page'];
    this.list = (json['list'] as List<dynamic>).map((item) {
      return Comment.fromMap(item);
    }).toList();
  }
}

class Comment {
  late int id;
  late int userId;
  late String userName;
  late int colorType;
  late String addTime;
  late String updateTime;
  late bool deleted;
  Comment.fromMap(Map<String, dynamic> json) {
    this.id = json['id'];
    this.userId = json['userId'];
    this.userName = json['use'];
    this.colorType = json['colorType'];
    this.addTime = json['addTime'];
    this.updateTime = json['updateTime'];
    this.deleted = json['deleted'];
  }
}
// class list {
//   int id;
//   int userId;
//   String userName;
//   int colorType;
//   String addTime;
//   String updateTime;
//   bool deleted;

//   list(
//       {required this.id,
//       required this.userId,
//       required this.userName,
//       required this.colorType,
//       required this.addTime,
//       required this.updateTime,
//       required this.deleted});

 
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['userId'] = this.userId;
//     data['userName'] = this.userName;
//     data['colorType'] = this.colorType;
//     data['addTime'] = this.addTime;
//     data['updateTime'] = this.updateTime;
//     data['deleted'] = this.deleted;
//     return data;
//   }
// }


