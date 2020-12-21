import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/models/post.dart';
import 'package:i_funny/services/post_repository.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostEmptyState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostLoadEvent) {
      yield PostLoadingState();
      try {
        final List<Post> _loadedPostList = await postRepository.getAllPost();
        yield PostLoadedState(loadedPost: _loadedPostList);
      } catch (e) {
        yield PostErrorState();
        print(e);
      }
    } else if (event is PostClearEvent) {
      yield PostEmptyState();
    }
  }
}
