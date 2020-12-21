import 'package:i_funny/models/post.dart';

import 'post_api_provider.dart';

class PostRepository {
  PostProvider _postProvider = PostProvider();
  Future<List<Post>> getAllPost() => _postProvider.getPosts();
}