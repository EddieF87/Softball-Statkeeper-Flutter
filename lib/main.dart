import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/store/player_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/user_store.dart';
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
    Color primaryColor = Color(0xFF689F38);
    Color primaryColorLight = Color(0xFFe5f4d3);
    Color primaryColorDark = Color(0xFF4a7326);
    Color accentColor = Color(0xFFeabd53);

    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => UserStore(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider(
          builder: (_) => PlayerStore(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Sleek Stats Softball Lite',
        theme: ThemeData(
            primarySwatch: MaterialColor(0xFF689F38, primarySwatch),
            primaryColor: primaryColor,
            primaryColorLight: primaryColorLight,
            primaryColorDark: primaryColorDark,
            accentColor: accentColor,
            textTheme: TextTheme(
//          title: TextStyle(
//            color: Colors.white,
//          ),
              body1: TextStyle(
                color: primaryColorDark,
              ),
              body2: TextStyle(
                color: primaryColorDark,
              ),
              display1: TextStyle(
                color: primaryColorDark,
              ),
              display2: TextStyle(
                color: primaryColorDark,
              ),
            ),
            primaryTextTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
              ),
              body1: TextStyle(
                color: primaryColorDark,
              ),
              body2: TextStyle(
                color: primaryColorDark,
              ),
              display1: TextStyle(
                color: primaryColorDark,
              ),
              display2: TextStyle(
                color: primaryColorDark,
              ),
            ),
            scaffoldBackgroundColor: primaryColorLight),
        home: const HomeScreen(title: 'Sleek Stats Softball Lite'),
      ),
    );
  }
}
