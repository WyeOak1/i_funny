import 'package:i_funny/models/post.dart';
import '../constants.dart';
import 'post_api_provider.dart';

class PostRepository {
  PostProvider _postProvider = PostProvider();
  Future<List<Post>> getFeaturedAllPost() => _postProvider.getPosts(featuredUrl);
  Future<List<Post>> getChannelPosts(url) => _postProvider.getPosts(url);


}