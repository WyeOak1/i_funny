import 'package:flutter/material.dart';
import 'package:i_funny/pages/favorite_page/FavoritePage.dart';
import 'package:provider/provider.dart';

import 'pages/home_page/HomePage.dart';
import 'pages/setting_page/SettingsPage.dart';
import 'services/theme_provider.dart';

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
            title: 'kek',
            theme: notifier.darkTheme ? dark : light,
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/favorite': (context) => FavoritePage(),
              '/settings': (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
