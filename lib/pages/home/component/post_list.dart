import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:i_funny/bloc/post/post_bloc.dart';
import 'package:i_funny/bloc/post/post_state.dart';

import 'action_row_buttons.dart';



class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostEmptyState) {
          return Center(
            child: Text('No data. Press button "Load"'),
          );
        }

        if (state is PostLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostLoadedState) {
          return Stack(children: [
            Swiper(
              itemCount: state.loadedPost.length,
              // ignore: missing_return
              itemBuilder: (context, index) {
                if (state.loadedPost[index].type == 'pic') {
                  return Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                    
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Image.network(
                        state.loadedPost[index].sizeUrl,
                        fit: BoxFit.contain,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 15,
                      child: BottomActionButttons(
                        smile: state.loadedPost[index].smile,
                      ),
                    ),
                  ]);
                }
              },
            ),
          ]);
        }

        if (state is PostErrorState) {
          return Center(
            child: Text('error'),
          );
        }
        return Center(
          child: Text('asdasdas'),
        );
      },
    );
  }
}
