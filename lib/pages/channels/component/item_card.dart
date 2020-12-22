import 'package:flutter/material.dart';
import 'package:i_funny/models/channel.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Channel channel;
  final Function press;
  const ItemCard({
    Key key,
    this.channel,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${channel.id}",
                child: Image.network(channel.url),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(
              channel.name,
            ),
          ),
        ],
      ),
    );
  }
}
