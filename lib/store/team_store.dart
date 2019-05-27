import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:sleekstats_flutter_statkeeper/store/players_group_store.dart';
import 'package:uuid/uuid.dart';

part 'team_store.g.dart';

class TeamStore = _TeamStore with _$TeamStore implements PlayersGroupStore;

// The store-class
abstract class _TeamStore implements Store {
  String playerStatToSortBy;

  @observable
  Team team;

  @observable
  ObservableList<Player> players = ObservableList();

  @action
  setTeam(Team newTeam) {
    team = newTeam;
    populateTeam(team.statkeeperFireID, team.fireID);
  }

  @action
  Future setTeamFromDB(String statKeeperFireID, String fireID) async {
    team = await RepositoryServiceTeams.getTeam(fireID);
  }

  @action
  Future<Team> getTeamFromDB(String statKeeperFireID, String fireID) async {
    if (team != null) {
      return team;
    }
    team = await RepositoryServiceTeams.getTeam(fireID);
    await populateTeam(statKeeperFireID, fireID);
    return team;
  }

  @action
  void clearTeam() {
    team = null;
    players.clear();
  }

  @action
  Future populateTeam(String statKeeperFireID, String fireID) async {
    players.clear();
    players.addAll(await RepositoryServicePlayers.getAllPlayersFromTeam(
        statKeeperFireID, fireID));
    sortPlayers(playerStatToSortBy);
    players = players;
  }

  @action
  Future addPlayers(Map<int, String> playerNames) async {
    var uuid = new Uuid();
    playerNames.forEach((key, name) async {
      print("$key, $name");
      await RepositoryServicePlayers.insertPlayer(
        Player(
            fireID: uuid.v1(),
            teamFireID: team.fireID,
            statkeeperFireID: team.statkeeperFireID,
            name: name,
            team: team.name),
      );
    });
    await populateTeam(team.statkeeperFireID, team.fireID);
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
    players = players;
  }
}
