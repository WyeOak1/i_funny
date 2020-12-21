import 'package:flutter/material.dart';
class BottomActionButttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Icon(Icons.add_a_photo),
        Icon(Icons.delete),
        Text('smiles'),
        Icon(Icons.download_outlined),
        Icon(Icons.share),

      ],
    );
  }
}