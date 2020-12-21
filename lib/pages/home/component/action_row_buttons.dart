import 'package:flutter/material.dart';

class BottomActionButttons extends StatelessWidget {
  int smile;
  BottomActionButttons({this.smile});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Icon(
            Icons.add_a_photo,
            size: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Icon(
            Icons.delete,
            size: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text('$smile'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Icon(
            Icons.download_outlined,
            size: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Icon(
            Icons.share,
            size: 35,
          ),
        ),
      ],
    );
  }
}
