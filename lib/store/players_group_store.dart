import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

abstract class PlayersGroupStore{
  String playerStatToSortBy;
  ObservableList<Player> players;

  sortPlayers(String statToSortBy);

}