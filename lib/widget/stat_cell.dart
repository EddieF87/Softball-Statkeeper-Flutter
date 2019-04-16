import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class StatCell extends StatelessWidget {
  final dynamic data;
  final double width;
  final double textSize;
  final FontWeight fontWeight;
  final double border;
  final int maxLines;

  const StatCell({
    this.data,
    this.width = 50.0,
    this.textSize = 12.0,
    this.fontWeight = FontWeight.normal,
    this.border = .3,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(border: Border.all(width: border)),
      child: Text(
        StatFormatter.displayAmount(data),
        style: TextStyle(fontSize: textSize, fontWeight: fontWeight),
        maxLines: maxLines,
      ),
    );
  }
}
