import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class PlayerStatLabel extends StatelessWidget {
  final num amount;
  final String stat;
  final VoidCallback onTap;
  final formatter = NumberFormat("#.000");

  PlayerStatLabel({this.stat, this.amount, this.onTap});

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
          children: <Widget>[
            Text(_displayAmount()),
            Text(stat ?? "---"),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decorateBox() {
    if (Player.CHANGEABLE_LABELS.contains(stat)) {
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
    if (amount is double) {
      return formatter.format(amount);
    }
    return amount.toString() ?? "---";

  }

  VoidCallback setOnTap() {
    if (Player.CHANGEABLE_LABELS.contains(stat)) {
      return onTap;
    }
    return null;
  }
}
