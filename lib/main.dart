import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/SettingsPage.dart';
import 'pages/home_page/HomePage.dart';
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
              '/settings': (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
