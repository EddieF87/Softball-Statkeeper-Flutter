import 'package:flutter/material.dart';

class PlayerStatLabel extends StatelessWidget {
  num amount;
  String stat;

  PlayerStatLabel({
    @required this.stat,
    this.amount,
  })  : assert(stat != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_displayAmount()),
        Text(stat)
      ],
    );
  }

  _displayAmount() {
    if(amount == null) {
      return "---";
    } else {
      return amount.toString();
    }
  }

}