import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_row.dart';
import 'package:sleekstats_flutter_statkeeper/widget/stat_cell.dart';

class GroupPlayersStatsPage extends StatelessWidget {
  final Player p = Player(
      name: "Name",
      firestoreID: "DAFVSD",
      runs: 9,
      rbi: 9,
      singles: 9,
      doubles: 9,
      triples: 9);

  Widget _createDummyPlayersList() {
    List<Player> players = [];
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
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => PlayerStatRow(
            player: players[index],
            isColor: index.isEven,
          ),
      itemCount: players.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new SizedBox(
        width: 1076.0,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(width: 3),
            right: BorderSide(width: 3),
          )),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              Expanded(
                child: _createDummyPlayersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        _createHeaderCell("Name", width: 100.0),
        _createHeaderCell("Team", width: 70.0),
        _createHeaderCell("G"),
        _createHeaderCell("PA"),
        _createHeaderCell("AB"),
        _createHeaderCell("H"),
        _createHeaderCell("1B"),
        _createHeaderCell("2B"),
        _createHeaderCell("3B"),
        _createHeaderCell("HR"),
        _createHeaderCell("R"),
        _createHeaderCell("RBI"),
        _createHeaderCell("AVG", width: 70.0),
        _createHeaderCell("OBP", width: 70.0),
        _createHeaderCell("SLG", width: 70.0),
        _createHeaderCell("OPS", width: 70.0),
        _createHeaderCell("OBP+E", width: 70.0),
        _createHeaderCell("SB"),
      ],
    );
  }

  StatCell _createHeaderCell(String data,
      {double width = 50.0}) {
    return StatCell(
      data: data,
      fontWeight: FontWeight.bold,
      width: width,
      border: 3.0,
    );
  }
}
