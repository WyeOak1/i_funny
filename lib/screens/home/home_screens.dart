import 'package:flutter/material.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          Text(
            '$kek',
            style: TextStyle(color: Color.fromRGBO(46, 82, 115, 1)),
          ),
          Text(
            '$feed',
            style: TextStyle(color: Color.fromRGBO(130, 151, 171, 1)),
          )
        ],
      ),
      actions: [
        FlatButton(
          child: Text('39'),
          minWidth: 5,
          onPressed: () {},
        )
      ],
    );
  }
}
