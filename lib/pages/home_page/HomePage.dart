
import '../../widgets/NavDrawer.dart';
import 'package:flutter/material.dart';

import 'home_screens.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('уу ыука'),),
      drawer: NavDrawer(),
      body: HomePage1(),
    );
  }
}