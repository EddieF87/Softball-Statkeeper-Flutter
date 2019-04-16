import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class PlayerStatLabel extends StatelessWidget {
  final num amount;
  final String stat;
  final VoidCallback onTap;

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
            Text(StatFormatter.displayAmount(amount)),
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



  ///Change stat to edit based on what user taps
  VoidCallback setOnTap() {
    if (Player.CHANGEABLE_LABELS.contains(stat)) {
      return onTap;
    }
    return null;
  }
}
