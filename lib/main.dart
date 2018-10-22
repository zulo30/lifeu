import 'package:flutter/material.dart';
import 'views/root_page.dart';
import 'views/auth/auth.dart';
import 'views/form_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'lifeu',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RootPage( auth: new Auth()),
      routes: <String, WidgetBuilder> {
        '/root': (context) => RootPage( auth: new Auth()),

      },
      initialRoute: '/',
    );
  }
}