import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlayerStatLabel extends StatelessWidget {
  final num amount;
  final String stat;
  final VoidCallback onTap;
  final formatter = NumberFormat("#.000");

  PlayerStatLabel({@required this.stat, this.amount, this.onTap})
      : assert(stat != null);

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD PlayerStatLabel  stat");
    return InkWell(
      borderRadius: BorderRadius.circular(4.0),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(_displayAmount()), Text(stat)],
      ),
    );
  }

  _displayAmount() {
    if (amount == null) {
      return "---";
    } else if (amount is double){
      return formatter.format(amount);
    } else {
      return amount.toString();
    }
  }
}
