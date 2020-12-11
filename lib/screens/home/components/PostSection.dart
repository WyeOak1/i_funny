import 'package:flutter/material.dart';
import 'package:i_funny/screens/home/components/PostFirstRow.dart';
import 'Post.dart';
class PostSection extends StatelessWidget {
  final int smile;
  final int views;
  final String urlProfilePhoto;

 
  final String urlPost;
  PostSection({this.urlProfilePhoto, this.urlPost, this.views, this.smile});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostFirstRow(urlProfilePhoto: urlProfilePhoto),
          SizedBox(
            height: 10,
          ),
          PostPicture(urlPost: urlPost),
          SizedBox(
            height: 5,
          ),
          Text(
            smile.toString(),
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          SizedBox(
            height: 8,
          ),
          Text(views.toString())
        ],
      ),
    );
  }
}
