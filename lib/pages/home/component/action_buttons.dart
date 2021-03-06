import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/post/post_bloc.dart';
import 'package:i_funny/bloc/post/post_event.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FeaturedLoadEvent());

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            postBloc.add(FeaturedLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            postBloc.add(FeaturedClearEvent());
          },
          color: Colors.red,
        )
      ],
    );
  }
}
