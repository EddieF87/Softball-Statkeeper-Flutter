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
    return Container(
      decoration: _decorateBox(),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: setOnTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_displayAmount()),
            Text(stat ?? "- - -"),
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

  ///If stat amount is a double, format as #.000, if null, format as "---"
  _displayAmount() {
    if (amount is double) {
      return formatter.format(amount) ?? "- - -";
    }
    return amount != null ? amount.toString() : "- - -";
  }

  ///Change stat to edit based on what user taps
  VoidCallback setOnTap() {
    if (Player.CHANGEABLE_LABELS.contains(stat)) {
      return onTap;
    }
    return null;
  }
}
