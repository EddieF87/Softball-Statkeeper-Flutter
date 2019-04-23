import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class StatCell extends StatelessWidget {
  final dynamic data;
  final double width;
  final FontWeight fontWeight;
  final int maxLines;
  final bool isHeaderRow;

  const StatCell({
    this.data,
    this.width = 50.0,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.isHeaderRow = false,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColorDark = Theme.of(context).primaryColorDark;
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: width,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(border: Border.all(color: primaryColor, width: 0.3)),
      child: Text(
        StatFormatter.displayAmount(data),
        style: TextStyle(fontSize: 12.0, fontWeight: fontWeight, color: isHeaderRow ? Colors.white : primaryColorDark),
        maxLines: maxLines,

      ),
    );
  }
}
