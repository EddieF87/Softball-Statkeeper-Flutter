import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_stats.dart';

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
    return Container(
      decoration: _decorateBox(),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: setOnTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_displayAmount()), Text(stat)],
        ),
      ),
    );
  }

  BoxDecoration _decorateBox() {
    if (PlayerStats.CHANGEABLE_LABELS.contains(stat)) {
      return BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
      );
    } else {
      return BoxDecoration();
    }
  }

  _displayAmount() {
    if (amount == null) {
      return "---";
    } else if (amount is double) {
      return formatter.format(amount);
    } else {
      return amount.toString();
    }
  }

  VoidCallback setOnTap() {
    if (PlayerStats.CHANGEABLE_LABELS.contains(stat)) {
      return onTap;
    }
    return null;
  }
}
