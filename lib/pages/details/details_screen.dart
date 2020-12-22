import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/post/post_bloc.dart';
import 'package:i_funny/services/post_repository.dart';

import 'components/body.dart';


class DetailsScreen extends StatelessWidget {
  String channelId;
  final postRepository = PostRepository();
  DetailsScreen({this.channelId});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => PostBloc(postRepository)),
    ],
      child: Scaffold(
      appBar: buildAppBar(context),
      body: Body(id: channelId),
    ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[

      ],
    );
  }
}
