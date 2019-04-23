import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class StandingsCell extends StatelessWidget {
  final dynamic data;
  final int flexAmount;
  final FontWeight fontWeight;
  final int maxLines;
  final bool isHeaderRow;

  const StandingsCell({
    this.data,
    this.flexAmount = 1,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.isHeaderRow = false,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColor = Theme.of(context).primaryColor;
    return Expanded(
      flex: flexAmount,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration:
            BoxDecoration(border: Border.all(color: primaryColor, width: 0.3)),
        child: Text(
          StatFormatter.displayAmount(data),
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: fontWeight,
              color: isHeaderRow ? Colors.white : primaryColorDark),
          maxLines: maxLines,
        ),
      ),
    );
  }
}
