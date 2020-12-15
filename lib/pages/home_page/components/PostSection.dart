import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:i_funny/database/database_helper.dart';
import 'package:i_funny/database/model/post.dart';
import 'Post.dart';
import 'PostFirstRow.dart';

class PostSection extends StatelessWidget {
  final String data;
  final int index;

  PostSection({
    this.data,
    this.index,
  });
  final dbHelper = DatabaseHelper.instance;
  List<Post> posts = [];

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
          PostFirstRow(data: data, index: index),
          SizedBox(
            height: 10,
          ),
          PostPicture(
            data: data,
            index: index,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/like.svg',
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _insert();
                  }),
              IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/dislike.svg',
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _queryAll();
                    print('do  $posts.first.title');
                    delete(jsonDecode(data)['data']['content']['items'][index]
                        ['thumb']['proportional_webp_url']);
                    _queryAll();
                    
                    posts.forEach((element) {
                      print('element   $element');
                    });
                  }),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 12),
                child: Text(
                  jsonDecode(data)['data']['content']['items'][index]['num']
                          ['smiles']
                      .toString(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/download.svg',
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/mail.svg',
                    color: Colors.red,
                  ),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  void _delete(id) async {
    final rowsDeleted = await dbHelper.delete(id);
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    posts.clear();
    allRows.forEach((row) => posts.add(Post.fromMap(row)));
    // setState(() {});
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: jsonDecode(data)['data']['content']['items']
          [index]['title'],
      DatabaseHelper.columnUrl: jsonDecode(data)['data']['content']['items']
          [index]['thumb']['proportional_webp_url'],
    };
    Post post = Post.fromMap(row);
    posts.add(post);
    print(jsonDecode(data)['data']['content']['items'][index]['id']);
    print(row);
    final id = await dbHelper.insert(post);
  }
}
