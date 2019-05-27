import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/store/players_group_store.dart';

part 'league_store.g.dart';

class LeagueStore = _LeagueStore with _$LeagueStore implements PlayersGroupStore;

// The store-class
abstract class _LeagueStore implements Store {

  @observable
  ObservableList<Team> teams = ObservableList();

  @observable
  ObservableList<Player> players = ObservableList();

  String playerStatToSortBy;

  @action
  Future populateLeague(String fireID) async {
    teams.clear();
    players.clear();

    teams.addAll(await RepositoryServiceTeams.getAllTeams(fireID));
    players.addAll(await RepositoryServicePlayers.getAllPlayers(fireID));

    teams = teams;
    players = players;
    sortPlayers(playerStatToSortBy);
  }

  @action
  sortPlayers(String statToSortBy) {
    playerStatToSortBy = statToSortBy;
    Map<String, Comparator<Player>> comparatorMap = Player.toComparatorMap();
    if (comparatorMap.containsKey(statToSortBy)) {
      players.sort(comparatorMap[statToSortBy]);
    } else {
      players.sort(comparatorMap[Player.LABEL_G]);
    }
  }

  @action
  void clearLeague() {
    teams.clear();
    players.clear();
  }
}