import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/widget/stat_cell.dart';

class StatsHeaderRow extends StatelessWidget {
  final ValueChanged<String> onStatSelected;
  final String statSorted;
  final Color primaryColor = Color(0xFF689F38);
  final Color accentColor = Color(0xFFeabd53);

  StatsHeaderRow({
    this.onStatSelected,
    this.statSorted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _createHeaderCell(Player.LABEL_NAME, width: 100.0),
        _createHeaderCell(Player.LABEL_TEAM, width: 70.0),
        _createHeaderCell(Player.LABEL_G),
        _createHeaderCell(Player.LABEL_PA),
        _createHeaderCell(Player.LABEL_AB),
        _createHeaderCell(Player.LABEL_H),
        _createHeaderCell(Player.LABEL_1B),
        _createHeaderCell(Player.LABEL_2B),
        _createHeaderCell(Player.LABEL_3B),
        _createHeaderCell(Player.LABEL_HR),
        _createHeaderCell(Player.LABEL_R),
        _createHeaderCell(Player.LABEL_RBI),
        _createHeaderCell(Player.LABEL_AVG, width: 70.0),
        _createHeaderCell(Player.LABEL_OBP, width: 70.0),
        _createHeaderCell(Player.LABEL_SLG, width: 70.0),
        _createHeaderCell(Player.LABEL_OPS, width: 70.0),
        _createHeaderCell(Player.LABEL_OBPROE, width: 70.0),
        _createHeaderCell(Player.LABEL_BB),
        _createHeaderCell(Player.LABEL_SB),
        _createHeaderCell(Player.LABEL_OUT),
        _createHeaderCell(Player.LABEL_SF),
        _createHeaderCell(Player.LABEL_ROE),
        _createHeaderCell(Player.LABEL_K),
      ],
    );
  }

  Widget _createHeaderCell(String data, {double width = 50.0}) {
    bool isSorted = statSorted == data;
    return Container(
      color: isSorted ? accentColor : primaryColor,
      child: InkWell(
        onTap: () => onStatSelected(data),
        child: StatCell(
          data: data,
          fontWeight: FontWeight.bold,
          width: width,
          isHeaderRow: true,
        ),
      ),
    );
  }
}
