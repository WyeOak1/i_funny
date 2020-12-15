import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:i_funny/database/model/post.dart';
import 'package:i_funny/widgets/NavDrawer.dart';

class FavoritePage extends StatelessWidget {
  List<Post> imageList = [];
  FavoritePage({this.imageList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
          centerTitle: true,
        ),
        drawer: NavDrawer(),
        body: Swiper(
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Image.network(
              imageList[index].url,
              fit: BoxFit.cover,
            );
          },
        ));
  }
}
