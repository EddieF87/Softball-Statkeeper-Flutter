import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';

class StatCell extends StatelessWidget {
  final dynamic data;
  final String statName;
  final double width;
  final FontWeight fontWeight;
  final int maxLines;
  final StatCellTextColor textColor;

  const StatCell({
    Key key,
    this.data,
    this.statName = "",
    this.width = 50.0,
    this.fontWeight = FontWeight.normal,
    this.maxLines = 1,
    this.textColor = StatCellTextColor.DEFAULT,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: width,
      padding: EdgeInsets.all(4.0),
      decoration:
          BoxDecoration(border: Border.all(color: primaryColor, width: 0.3)),
      child: Observer(
        builder: (_) => Text(
          StatFormatter.displayAmount(statName: statName, amount: data),
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: fontWeight,
            color: _getColor(
              color: textColor,
              context: context,
            ),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }

  Color _getColor({StatCellTextColor color, BuildContext context}) {
    bool showGender = Provider.of<StatKeeperStore>(context).showGender;
    switch (color) {
      case StatCellTextColor.DEFAULT:
        return Theme.of(context).primaryColorDark;
      case StatCellTextColor.HEADER:
        return Colors.white;
      case StatCellTextColor.BOY:
        return showGender ? Colors.blue : Theme.of(context).primaryColorDark;
      case StatCellTextColor.GIRL:
        return showGender ? Colors.pink : Theme.of(context).primaryColorDark;
      default:
        return Colors.orange;
    }
  }
}

enum StatCellTextColor { DEFAULT, HEADER, BOY, GIRL }
