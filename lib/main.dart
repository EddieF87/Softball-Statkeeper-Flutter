import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/store/user_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/home/home_screen.dart';

import 'database/moor_tables.dart';

MyDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = constructDb();
  runApp(MyApp());
}

void onStart() async {}

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
          create: (BuildContext context) => UserStore(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider(
          create: (BuildContext context) => StatKeeperStore(),
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
            buttonTheme: ButtonThemeData(
              buttonColor: accentColor,
              highlightColor: primaryColor,
//              splashColor: primaryColor,
              textTheme: ButtonTextTheme.primary,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(13.0)),
//                side: BorderSide(
//                  color: primaryColor,
//                  width: 2.0,
//                ),
//              ),
            ),
            textTheme: TextTheme(
//          title: TextStyle(
//            color: Colors.white,
//          ),
              bodyText2: TextStyle(
                color: primaryColorDark,
              ),
              bodyText1: TextStyle(
                color: primaryColorDark,
              ),
              headline4: TextStyle(
                color: primaryColorDark,
              ),
              headline3: TextStyle(
                color: primaryColorDark,
              ),
            ),
            primaryTextTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: primaryColorDark,
              ),
              bodyText1: TextStyle(
                color: primaryColorDark,
              ),
              headline4: TextStyle(
                color: primaryColorDark,
              ),
              headline3: TextStyle(
                color: primaryColorDark,
              ),
            ),
            scaffoldBackgroundColor: primaryColorLight),
        home: const HomeScreen(),
      ),
    );
  }
}
