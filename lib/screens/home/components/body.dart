import 'package:flutter/material.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Categories(),
      buildImage(context)],
    );
  }

  Container buildImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Container(color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: 400,),
    );
  }
}
