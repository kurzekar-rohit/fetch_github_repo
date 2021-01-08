import 'package:flutter/material.dart';
import 'package:github_api_unite_cloud/Screens/DetailPage.dart';
import 'package:github_api_unite_cloud/Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homepage': (context) => HomePage(),
        '/detailpage': (context) => DetailPage(),
      },
      home: HomePage(),
    );
  }
}
