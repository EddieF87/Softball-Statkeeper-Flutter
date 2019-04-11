import 'package:flutter/material.dart';

class PlayerStatLabel extends StatelessWidget {
  int amount;
  String stat;

  PlayerStatLabel({
    @required this.stat,
    @required this.amount
  })  : assert(stat != null),
        assert(amount != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(amount.toString()),
        Text(stat)
      ],
    );
  }

}