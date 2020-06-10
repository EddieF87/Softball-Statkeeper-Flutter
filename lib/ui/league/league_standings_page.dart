import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';
import 'package:sleekstats_flutter_statkeeper/store/statkeeper_store.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/teams_pageview.dart';
import 'package:sleekstats_flutter_statkeeper/utils/stat_formatter.dart';
import 'package:sleekstats_flutter_statkeeper/ui/league/standings_row.dart';

class LeagueStandingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatKeeperStore statKeeperStore = Provider.of<StatKeeperStore>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Theme.of(context).primaryColor, width: 4.0),
      ),
      child: Column(
        children: <Widget>[
          StandingsHeaderRow(
            onStatSelected: (stat) => statKeeperStore.sortTeams(stat),
          ),
          Expanded(
            child: Observer(
              builder: (_) => ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        StandingsRow(
                          team: statKeeperStore.teams[index],
                          isColoredRow: index.isOdd,
                          onTeamSelected: () =>
                              _navigateToTeamsPageView(context, index),
                        ),
                    itemCount: statKeeperStore.teams.length,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the PageView of teams.
  void _navigateToTeamsPageView(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) =>
            TeamsPageView(startingIndex: index),
      ),
    );
  }
}

class StandingsHeaderRow extends StatefulWidget {
  final ValueChanged<String> onStatSelected;

  StandingsHeaderRow({this.onStatSelected});

  @override
  _StandingsHeaderRowState createState() => _StandingsHeaderRowState();
}

class _StandingsHeaderRowState extends State<StandingsHeaderRow> {
  final Color primaryColor = Color(0xFF689F38);
  final Color accentColor = Color(0xFFeabd53);
  String selectedStat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _createHeaderCell(TeamUtils.LABEL_TEAM, flexAmount: 3),
        _createHeaderCell(TeamUtils.LABEL_W),
        _createHeaderCell(TeamUtils.LABEL_L),
        _createHeaderCell(TeamUtils.LABEL_T),
        _createHeaderCell(TeamUtils.LABEL_WINPCT, flexAmount: 2),
        _createHeaderCell(TeamUtils.LABEL_RS),
        _createHeaderCell(TeamUtils.LABEL_RA),
        _createHeaderCell(TeamUtils.LABEL_RUNDIFF),
      ],
    );
  }

  Widget _createHeaderCell(String data, {int flexAmount = 1}) {
    bool isSorted = selectedStat == data;
    return Expanded(
      flex: flexAmount,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: primaryColor,
        child: InkWell(
          onTap: () {
            setState(() => selectedStat = data);
            widget.onStatSelected(data);
          },
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
}
