import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_row.dart';
import 'package:sleekstats_flutter_statkeeper/widget/stats_header_row.dart';

class PlayersStatsTable extends StatefulWidget {
  @override
  State<PlayersStatsTable> createState() => PlayersStatsTableState();
}

class PlayersStatsTableState extends State<PlayersStatsTable> {
  List<Player> players = [];
  String statToSortBy = Player.LABEL_G;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    for (int i = 1; i < 90; i++) {
      players.add(Player(
          firestoreID: "FVVVVVVVVVV",
          name: "OFEOOFEO",
          rbi: random.nextInt(130),
          runs: random.nextInt(130),
          stolenBases: random.nextInt(130),
          strikeOuts: random.nextInt(130),
          sacFlies: random.nextInt(130),
          singles: random.nextInt(130),
          games: random.nextInt(130),
          hrs: random.nextInt(130),
          gender: random.nextInt(130),
          hbp: random.nextInt(130),
          doubles: random.nextInt(130),
          triples: random.nextInt(130),
          walks: random.nextInt(130),
          outs: random.nextInt(130),
          reachedOnErrors: random.nextInt(130),
          team: "REWEVDCSWFD"));
    }
  }

  _sortPlayers(String stat) {
    Map<String, Comparator<Player>> comparatorMap = Player.toComparatorMap();
    if (comparatorMap.containsKey(stat)) {
      players.sort(comparatorMap[stat]);
    } else {
      players.sort(comparatorMap[Player.LABEL_G]);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 4.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new SizedBox(
          width: 1320.0,
          child: Column(
            children: <Widget>[
              StatsHeaderRow(
                statSorted: statToSortBy,
                onStatSelected: (statLabel) => setState(() {
                      statToSortBy = statLabel;
                    }),
              ),
              Expanded(
                child: _buildList(statToSortBy),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildList(String stat) {
    _sortPlayers(stat);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => PlayerStatRow(
            player: players[index],
            isColoredRow: index.isOdd,
          ),
      itemCount: players.length,
    );
  }
}
