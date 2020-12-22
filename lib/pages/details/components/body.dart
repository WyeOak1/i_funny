import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/post/post_bloc.dart';
import 'package:i_funny/bloc/post/post_event.dart';
import 'package:i_funny/bloc/post/post_state.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  String id;
  Body({this.id});
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    // ignore: close_sinks
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(ChangeValue(id));
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: BlocBuilder<PostBloc, PostState>(
                    builder: (context, state) {
                      if (state is PostLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is PostLoadedState) {
                        return ListView.builder(
                            itemCount: state.loadedPost.length,
                            // ignore: missing_return
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: <Widget>[
                                    Image.network(state.loadedPost[index].url),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 50,
                                    ),
                                  ],
                                ),
                              );
                            });
                      }

                      if (state is PostErrorState) {
                        return Center(
                          child: Text('error'),
                        );
                      }
                      return Center(
                        child: Text('asdasdas'),
                      );

                      })
                ),
                ProductTitleWithImage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
