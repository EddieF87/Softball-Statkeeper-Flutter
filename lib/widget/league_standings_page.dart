import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';
import 'package:sleekstats_flutter_statkeeper/widget/standings_row.dart';

class LeagueStandingsPage extends StatefulWidget {
  final List<Team> teams;

  const LeagueStandingsPage({Key key, this.teams}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LeagueStandingsPageState();
}

class LeagueStandingsPageState extends State<LeagueStandingsPage> {
  String statToSortBy = Team.LABEL_WINPCT;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor, width: 4.0),
      ),
      child: Column(
        children: <Widget>[
          StandingsHeaderRow(
            statSorted: statToSortBy,
            onStatSelected: (stat) {
              debugPrint("onStatSelected $stat");
              setState(() {
                debugPrint("setState");
                statToSortBy = stat;
              });
            },
          ),
          Expanded(child: _buildList(statToSortBy)),
        ],
      ),
    );
  }

  Widget _buildList(String stat) {
    _sortTeams(stat);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => StandingsRow(
            team: widget.teams[index],
            isColoredRow: index.isOdd,
          ),
      itemCount: widget.teams.length,
    );
  }

  void _sortTeams(String stat) {
    Map<String, Comparator<Team>> comparatorMap = Team.toComparatorMap();
    if (comparatorMap.containsKey(stat)) {
      widget.teams.sort(comparatorMap[stat]);
    } else {
      widget.teams.sort(comparatorMap[Team.LABEL_WINPCT]);
    }
  }
}

class StandingsHeaderRow extends StatelessWidget {
  final ValueChanged<String> onStatSelected;
  final String statSorted;
  final Color primaryColor = Color(0xFF689F38);
  final Color accentColor = Color(0xFFeabd53);

  StandingsHeaderRow({
    this.onStatSelected,
    this.statSorted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _createHeaderCell(Team.LABEL_TEAM, flexAmount: 3),
        _createHeaderCell(Team.LABEL_W),
        _createHeaderCell(Team.LABEL_L),
        _createHeaderCell(Team.LABEL_T),
        _createHeaderCell(Team.LABEL_WINPCT, flexAmount: 2),
        _createHeaderCell(Team.LABEL_RS),
        _createHeaderCell(Team.LABEL_RA),
        _createHeaderCell(Team.LABEL_RUNDIFF),
      ],
    );
  }

  Widget _createHeaderCell(String data, {int flexAmount = 1}) {
    bool isSorted = statSorted == data;
    return Expanded(
      flex: flexAmount,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: primaryColor,
        child: InkWell(
          onTap: () => _ontapped(data),
          child: Text(
            StatFormatter.displayAmount(data),
            style: TextStyle(
              fontSize: 12.0,
              color: isSorted ? accentColor : Colors.white,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  _ontapped(String data) {
    debugPrint("_ontapped");
    onStatSelected(data);
  }
}
