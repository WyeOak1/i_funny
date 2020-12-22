import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/post/post_bloc.dart';
import 'package:i_funny/services/post_repository.dart';
import 'package:i_funny/widgets/nav_drawer.dart';
import 'component/post_list.dart';

class HomePage extends StatelessWidget {
  final postRepository = PostRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc(postRepository)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        drawer: NavDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ActionButtons(),
            Expanded(child: PostList()),
          ],
        ),
      ),
    );
  }
}
