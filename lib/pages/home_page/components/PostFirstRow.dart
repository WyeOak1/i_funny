import 'dart:convert';

import 'package:flutter/material.dart';

class PostFirstRow extends StatelessWidget {
  final String data;
  final int index;
  PostFirstRow({this.data, this.index});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) =>
                //         FavoritePage(url: jsonDecode(data)['data']['content']['items'][index]
                //         ['thumb']['proportional_webp_url'])));
              },
              child: Hero(
                tag: jsonDecode(data)['data']['content']['items'][index]
                        ['thumb']['proportional_webp_url'],
                child: CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(jsonDecode(data)['data']['content']['items'][index]
                        ['thumb']['proportional_webp_url']),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jsonDecode(data)['data']['content']['items'][index]
                        ['creator']['nick'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Iceland",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
              ],
            )
          ],
        ),
        Icon(Icons.more_vert)
      ],
    );
  }
}
