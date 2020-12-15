import '../database_helper.dart';

class Post {
  int id;
  String title;
  String url;
 
  Post(this.title, this.url);
 
  Post.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    url = map['url'];
  }
 
  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnUrl: url,
    };
  }
}