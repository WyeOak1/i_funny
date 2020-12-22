import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:i_funny/services/theme_notifired.dart';
import 'package:i_funny/widgets/nav_drawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: NavDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<ThemeNotifier>(
                builder:(context, notifier, child) => 
                  SwitchListTile(
                    title: Text("Dark Mode"),
                    onChanged:(value){
                      notifier.toggleTheme();
                  } ,
                  value: notifier.darkTheme ,
              ),
            ),

            Card(
              child: ListTile(
                title: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
              ),
            ),
          ]
        ),
      )
    );
  }
}