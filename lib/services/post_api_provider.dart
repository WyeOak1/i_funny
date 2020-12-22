import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:i_funny/constants.dart';

import '../models/post.dart';

class PostProvider {
  Future<List<Post>> getPosts(String url) async {
    List<Post> posts = [];
    var response = await http.get(url, headers: featuredRequestHeaders);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 200) {
      jsonData["data"]["content"]["items"].forEach((element) {
        if (element['id'] != null) {
          Post post = Post(
              title: element['title'],
              url: element['url'],
              sizeUrl: element['thumb']['proportional_webp_url'],
              type: element['type'],
              smile: element['num']['smiles'],
              creatorNick: element['creator']['nick']);
          posts.add(post);
        }
      });
    }
    return posts;
  }
}
