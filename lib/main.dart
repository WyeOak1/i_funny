import 'package:flutter/material.dart';
import 'package:i_funny/pages/channels/channels_page.dart';
import 'package:provider/provider.dart';
import 'pages/Home/HomePage.dart';
import 'pages/settings/settings_page.dart';
import 'services/theme_notifired.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: notifier.darkTheme ? dark : light,
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/channels': (context) => ChannelsPage(),
              '/settings': (context) => SettingsPage(),
            },
          );
        }));
  }
}
