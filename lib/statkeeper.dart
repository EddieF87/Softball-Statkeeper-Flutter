import 'package:flutter/material.dart';

class StatKeeper extends StatelessWidget {
  final String name;

  const StatKeeper({Key key, @required this.name})
      : assert(name != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Container(
          padding: EdgeInsets.all(32.0),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0),
          )),
    );
  }
}
