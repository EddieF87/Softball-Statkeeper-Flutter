import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/route/statkeeper_route.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stats_page.dart';

class PlayerRoute extends StatKeeperRoute {
  PlayerRoute({Key key, this.title, this.firestoreID}) : super(key: key);
  final String title;
  final String firestoreID;

  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute> {
  String nameOfStatToUpdate;
  Player _player;

  @override
  void initState() {
    super.initState();
    setPlayer();
  }

  void setPlayer() async {
    Player playerFromFuture =
        await RepositoryServicePlayers.getPlayer(widget.firestoreID);
    setState(() {
      _player = playerFromFuture;
    });
  }

  void _chooseStatToUpdate(String newStatToUpdate) {
    if (nameOfStatToUpdate != newStatToUpdate) {
      setState(() => nameOfStatToUpdate = newStatToUpdate);
    }
  }

  void _updateStat(StatToUpdate statToUpdate) {
    if (Player.CHANGEABLE_LABELS.contains(statToUpdate.name)) {
      setState(() {
        switch (statToUpdate.name) {
          case Player.LABEL_R:
            _player.runs += statToUpdate.amount;
            break;
          case Player.LABEL_RBI:
            _player.rbi += statToUpdate.amount;
            break;
          case Player.LABEL_1B:
            _player.singles += statToUpdate.amount;
            break;
          case Player.LABEL_2B:
            _player.doubles += statToUpdate.amount;
            break;
          case Player.LABEL_3B:
            _player.triples += statToUpdate.amount;
            break;
          case Player.LABEL_HR:
            _player.hrs += statToUpdate.amount;
            break;
          case Player.LABEL_OUT:
            _player.outs += statToUpdate.amount;
            break;
          case Player.LABEL_ROE:
            _player.reachedOnErrors += statToUpdate.amount;
            break;
          case Player.LABEL_SF:
            _player.sacFlies += statToUpdate.amount;
            break;
          case Player.LABEL_BB:
            _player.walks += statToUpdate.amount;
            break;
          case Player.LABEL_SB:
            _player.stolenBases += statToUpdate.amount;
            break;
          case Player.LABEL_G:
            _player.games += statToUpdate.amount;
            break;
          case Player.LABEL_HBP:
            _player.strikeOuts += statToUpdate.amount;
            break;
          case Player.LABEL_K:
            _player.strikeOuts += statToUpdate.amount;
            break;
        }
      });
      RepositoryServicePlayers.updatePlayer(_player);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildPlayerStatsPage(_player),
        PlayerStatControls(
          stat: nameOfStatToUpdate,
          onSubmit: (statToUpdate) => _updateStat(statToUpdate),
        ),
      ],
    );
  }

  Widget _buildPlayerStatsPage(Player player) {
    if (player == null) {
      return Text("WAITING");
    } else {
      return PlayerStatsPage(
        player: player,
        onTap: (newStatToUpdate) => _chooseStatToUpdate(newStatToUpdate),
      );
    }
  }
}
