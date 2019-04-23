import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/ui/home/home_screen.dart';

void main() async {
  await DBCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> primarySwatch = {
      50: Color.fromRGBO(104, 159, 56, .1),
    };
    for (int i = 1; i < 10; i++) {
      primarySwatch.putIfAbsent(
        i * 100,
        () => Color.fromRGBO(136, 14, 79, (i + 1) * .1),
      );
    }
    return MaterialApp(
      title: 'Sleek Stats Softball Lite',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF689F38, primarySwatch),
        primaryColor: Color(0xFF689F38),
        primaryColorLight: Color(0xFFe5f4d3),
        primaryColorDark: Color(0xFF4a7326),
        accentColor: Color(0xFFeabd53),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(title: 'Sleek Stats Softball Lite'),
    );
  }
}
