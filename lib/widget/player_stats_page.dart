import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/widget/player_stat_controls.dart';
import 'package:sleekstats_flutter_statkeeper/widget/single_player_stats_display.dart';

class PlayerStatsPage extends StatefulWidget {
  final Player player;

  const PlayerStatsPage({
    Key key,
    this.player,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PlayerStatsPageState();
}

class PlayerStatsPageState extends State<PlayerStatsPage> {
  String nameOfStatToUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SinglePlayerStatsDisplay(
          player: widget.player,
          onTap: (newStatToUpdate) => _chooseStatToUpdate(newStatToUpdate),
        ),
        PlayerStatControls(
          stat: nameOfStatToUpdate,
          onSubmit: (statToUpdate) => _updateStat(statToUpdate),
        ),
      ],
    );
  }

  void _chooseStatToUpdate(String newStatToUpdate) {
    if (nameOfStatToUpdate != newStatToUpdate) {
      setState(() => nameOfStatToUpdate = newStatToUpdate);
    }
  }

  void _updateStat(StatToUpdate statToUpdate) {
    if (statToUpdate != null && Player.CHANGEABLE_LABELS.contains(statToUpdate.name)) {
      setState(() {
        switch (statToUpdate.name) {
          case Player.LABEL_R:
            widget.player.runs += statToUpdate.amount;
            break;
          case Player.LABEL_RBI:
            widget.player.rbi += statToUpdate.amount;
            break;
          case Player.LABEL_1B:
            widget.player.singles += statToUpdate.amount;
            break;
          case Player.LABEL_2B:
            widget.player.doubles += statToUpdate.amount;
            break;
          case Player.LABEL_3B:
            widget.player.triples += statToUpdate.amount;
            break;
          case Player.LABEL_HR:
            widget.player.hrs += statToUpdate.amount;
            break;
          case Player.LABEL_OUT:
            widget.player.outs += statToUpdate.amount;
            break;
          case Player.LABEL_ROE:
            widget.player.reachedOnErrors += statToUpdate.amount;
            break;
          case Player.LABEL_SF:
            widget.player.sacFlies += statToUpdate.amount;
            break;
          case Player.LABEL_BB:
            widget.player.walks += statToUpdate.amount;
            break;
          case Player.LABEL_SB:
            widget.player.stolenBases += statToUpdate.amount;
            break;
          case Player.LABEL_G:
            widget.player.games += statToUpdate.amount;
            break;
          case Player.LABEL_HBP:
            widget.player.strikeOuts += statToUpdate.amount;
            break;
          case Player.LABEL_K:
            widget.player.strikeOuts += statToUpdate.amount;
            break;
        }
      });
      RepositoryServicePlayers.updatePlayer(widget.player);
    }
  }
}
