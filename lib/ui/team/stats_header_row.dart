import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/ui/team/stat_cell.dart';

class StatsHeaderRow extends StatefulWidget {
  final ValueChanged<String> onStatSelected;
  final bool isLeague;

  StatsHeaderRow({
    this.onStatSelected,
    this.isLeague = false,
  });

  @override
  _StatsHeaderRowState createState() => _StatsHeaderRowState();
}

class _StatsHeaderRowState extends State<StatsHeaderRow> {
  final Color primaryColor = Color(0xFF689F38);
  final Color accentColor = Color(0xFFeabd53);
  String selectedStat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _createHeaderCell(PlayerUtils.LABEL_NAME, width: 100.0),
        widget.isLeague
            ? _createHeaderCell(PlayerUtils.LABEL_TEAM, width: 70.0)
            : Container(),
        _createHeaderCell(PlayerUtils.LABEL_G),
        _createHeaderCell(PlayerUtils.LABEL_PA),
        _createHeaderCell(PlayerUtils.LABEL_AB),
        _createHeaderCell(PlayerUtils.LABEL_H),
        _createHeaderCell(PlayerUtils.LABEL_1B),
        _createHeaderCell(PlayerUtils.LABEL_2B),
        _createHeaderCell(PlayerUtils.LABEL_3B),
        _createHeaderCell(PlayerUtils.LABEL_HR),
        _createHeaderCell(PlayerUtils.LABEL_R),
        _createHeaderCell(PlayerUtils.LABEL_RBI),
        _createHeaderCell(PlayerUtils.LABEL_AVG, width: 70.0),
        _createHeaderCell(PlayerUtils.LABEL_OBP, width: 70.0),
        _createHeaderCell(PlayerUtils.LABEL_SLG, width: 70.0),
        _createHeaderCell(PlayerUtils.LABEL_OPS, width: 70.0),
        _createHeaderCell(PlayerUtils.LABEL_OBPROE, width: 70.0),
        _createHeaderCell(PlayerUtils.LABEL_BB),
        _createHeaderCell(PlayerUtils.LABEL_SB),
        _createHeaderCell(PlayerUtils.LABEL_OUT),
        _createHeaderCell(PlayerUtils.LABEL_SF),
        _createHeaderCell(PlayerUtils.LABEL_ROE),
        _createHeaderCell(PlayerUtils.LABEL_K),
      ],
    );
  }

  Widget _createHeaderCell(String stat, {double width = 50.0}) {
    return Container(
      color: selectedStat == stat ? accentColor : primaryColor,
      child: InkWell(
        onTap: () {
          setState(() => selectedStat = stat);
          widget.onStatSelected(stat);
        },
        child: StatCell(
          data: stat,
          fontWeight: FontWeight.bold,
          width: width,
          textColor: StatCellTextColor.HEADER,
        ),
      ),
    );
  }
}
