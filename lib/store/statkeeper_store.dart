import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/firestore/firestore_service.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';
import 'package:uuid/uuid.dart';

part 'statkeeper_store.g.dart';

class StatKeeperStore = _StatKeeperStore with _$StatKeeperStore;

// The store-class
abstract class _StatKeeperStore with Store {
  String statkeeperFireID;

  @observable
  ObservableList<Team> teams = ObservableList();

  @observable
  ObservableList<Player> players = ObservableList();

  num currentPlayerIndex;

  @observable
  String playerStatToUpdate;

  String playerStatToSortBy;
  String teamStatToSortBy;
  bool populated = false;

  @action
  Future populateStatKeeper(String fireID) async {
    print("populateStatKeeper  $fireID");

    if (populated) {
      return;
    }
    teams.clear();
    players.clear();

    teams.addAll(await FirestoreService.getTeams(fireID));
    players.addAll(await FirestoreService.getPlayers(fireID));

//    teams.addAll(await RepositoryServiceTeams.getAllTeams(fireID));
//    players.addAll(await RepositoryServicePlayers.getAllPlayers(fireID));

    teams = teams;
    players = players;

//    sortPlayers(playerStatToSortBy);
    populated = true;
    print(
        "populateStatKeeper  $fireID  finisehd  ${players.length}  ${teams.length}");
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
  sortTeams(String statToSortBy) {
    teamStatToSortBy = statToSortBy;
    Map<String, Comparator<Team>> comparatorMap = Team.toComparatorMap();
    if (comparatorMap.containsKey(statToSortBy)) {
      teams.sort(comparatorMap[statToSortBy]);
    } else {
      teams.sort(comparatorMap[Team.LABEL_WINPCT]);
    }
  }

  @action
  Future addPlayers(int index, Map<int, String> playerNames) async {
    Team team = teams[index];

    var uuid = new Uuid();
    for (var name in playerNames.values) {
      Player player = Player(
        fireID: uuid.v1(),
        teamFireID: team.fireID,
        statkeeperFireID: statkeeperFireID,
        name: name,
        team: team.name,
      );
      player.id = await RepositoryServicePlayers.insertPlayer(player);
      if (player.id > 0) {
        players.add(player);
      }
    }
    players = players;
  }

  @action
  Future addTeams(Map<int, String> teamNames) async {
    var uuid = new Uuid();
    for (var name in teamNames.values) {
      Team team = Team(
        fireID: uuid.v1(),
        statkeeperFireID: statkeeperFireID,
        name: name,
      );
      team.id = await RepositoryServiceTeams.insertTeam(team);
      if (team.id > 0) {
        teams.add(team);
      }
    }
    teams = teams;
  }

  @action
  void clearStatKeeper() {
    statkeeperFireID = null;
    playerStatToUpdate = null;
    playerStatToSortBy = null;
    teamStatToSortBy = null;
    teams.clear();
    players.clear();
    populated = false;
  }

  Team getCurrentTeam(int index) {
    return teams[index];
  }

  Player getCurrentPlayer(int index) {
    return players[index];
  }

  @action
  setPlayerStatToUpdate(String stat) {
    playerStatToUpdate = stat;
  }

  @action
  Future updatePlayerCountingStat(int index, int amount) async {
    Player player = players[index];
    print("updatePlayerCountingStat  ${player.name}  $index   $playerStatToUpdate   $amount");
    if (playerStatToUpdate != null &&
        Player.CHANGEABLE_LABELS.contains(playerStatToUpdate)) {
      switch (playerStatToUpdate) {
        case Player.LABEL_R:
          player.runs += amount;
          if (player.runs < 0) player.runs = 0;
          break;
        case Player.LABEL_RBI:
          player.rbi += amount;
          if (player.rbi < 0) player.rbi = 0;
          break;
        case Player.LABEL_1B:
          player.singles += amount;
          if (player.singles < 0) player.singles = 0;
          break;
        case Player.LABEL_2B:
          player.doubles += amount;
          if (player.doubles < 0) player.doubles = 0;
          break;
        case Player.LABEL_3B:
          player.triples += amount;
          if (player.triples < 0) player.triples = 0;
          break;
        case Player.LABEL_HR:
          player.hrs += amount;
          if (player.hrs < 0) player.hrs = 0;
          break;
        case Player.LABEL_OUT:
          player.outs += amount;
          if (player.outs < 0) player.outs = 0;
          break;
        case Player.LABEL_ROE:
          player.reachedOnErrors += amount;
          if (player.reachedOnErrors < 0) player.reachedOnErrors = 0;
          break;
        case Player.LABEL_SF:
          player.sacFlies += amount;
          if (player.sacFlies < 0) player.sacFlies = 0;
          break;
        case Player.LABEL_BB:
          player.walks += amount;
          if (player.walks < 0) player.walks = 0;
          break;
        case Player.LABEL_SB:
          player.stolenBases += amount;
          if (player.stolenBases < 0) player.stolenBases = 0;
          break;
        case Player.LABEL_G:
          player.games += amount;
          if (player.games < 0) player.games = 0;
          break;
        case Player.LABEL_HBP:
          player.hbp += amount;
          if (player.hbp < 0) player.hbp = 0;
          break;
        case Player.LABEL_K:
          player.strikeOuts += amount;
          if (player.strikeOuts < 0) player.strikeOuts = 0;
          break;
        default:
          print("updatePlayerCountingStat  defaultdefaultdefaultdefault");
          return;
      }
    } else {
      print("updatePlayerCountingStat  elseelseelseelseelseelse");

    }
    int result = await RepositoryServicePlayers.updatePlayer(player);
    if (result > 0) {
      players = players;
    }
  }
}
