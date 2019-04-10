import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/route/home_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleek Stats Softball Lite',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeRoute(title: 'Sleek Stats Softball Lite'),
    );
  }
}