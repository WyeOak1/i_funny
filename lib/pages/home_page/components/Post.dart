import 'dart:convert';
import 'package:flutter/material.dart';

class PostPicture extends StatelessWidget {
  final String data;
  final int index;

  PostPicture({this.data, this.index});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getHeight(),
          width: getWidth(),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(jsonDecode(data)['data']['content']['items']
                    [index]['thumb']['proportional_webp_url']),
              )),
        ),
        // Positioned(
        //   bottom: 20,
        //   right: 20,
        //   child: Icon(Icons.favorite,
        //       size: 35, color: Colors.white.withOpacity(0.7)),
        // ),
        
      ],
    );
  }

  double getHeight() {
    int height = jsonDecode(data)['data']['content']['items'][index]['thumb']
        ['proportional_size']['h'];
    return height.toDouble();
  }

  double getWidth() {
    int width = jsonDecode(data)['data']['content']['items'][index]['thumb']
        ['proportional_size']['w'];
    return width.toDouble();
  }
}
