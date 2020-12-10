import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
  
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      onTap: (value) {
        // Respond to item press.
      },
      items: [
        BottomNavigationBarItem(
          title: Text('Like'),
          icon: SvgPicture.asset('assets/icons/like.svg'),
        ),
        BottomNavigationBarItem(
          title: Text('Music'),
          icon: SvgPicture.asset('assets/icons/dislike.svg'),
        ),
        BottomNavigationBarItem(
          title: Text('Places'),
          icon: SvgPicture.asset('assets/icons/download.svg'),
        ),
        BottomNavigationBarItem(
          title: Text('News'),
          icon: SvgPicture.asset('assets/icons/mail.svg'),
        ),
      ],
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
