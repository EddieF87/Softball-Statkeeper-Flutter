import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/firestore/firestore_service.dart';
import 'package:sleekstats_flutter_statkeeper/main.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';
import 'package:uuid/uuid.dart';

part 'statkeeper_store.g.dart';

class StatKeeperStore = _StatKeeperStore with _$StatKeeperStore;

// The store-class
abstract class _StatKeeperStore with Store {
  String statkeeperFireID;

  Stream<List<Team>> teamsStream = database.teamDao.watchAllTeams();
  Stream<List<Player>> playersStream = database.playerDao.watchAllPlayers();

  List<Player> players;
  List<Team> teams;

  @observable
  String playerStatToUpdate;

  String playerStatToSortBy;
  String teamStatToSortBy;
  bool populated = false;

  @observable
  bool showGender = false;

  @action
  Future populateStatKeeper(String fireID) async {
    print("populateStatKeeper  $fireID");

    if (populated) {
      return;
    }
    database.teamDao.clear();
    database.playerDao.clear();

    await FirestoreService.loadTeams(fireID);
    await FirestoreService.loadPlayers(fireID);
    print("loadPlayers FINISHED");

    players = await database.playerDao.getAllPlayersFromStatKeeper(fireID);
    print("getAllPlayersFromStatKeeper FINISHED");
    teams = await database.teamDao.getAllTeams(fireID);
    print("getAllTeams FINISHED");

//    sortPlayers(playerStatToSortBy);

    populated = true;
    print("populated FINISHED");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("SharedPreferences FINISHED");
    showGender = prefs.get("$statkeeperFireID-showGender") ?? false;
  }

  @action
  sortPlayers(String statToSortBy) {
    playerStatToSortBy = statToSortBy;
    Map<String, Comparator<Player>> comparatorMap =
        PlayerUtils.toComparatorMap();
    if (comparatorMap.containsKey(statToSortBy)) {
      players.sort(comparatorMap[statToSortBy]);
    } else {
      players.sort(comparatorMap[PlayerUtils.LABEL_G]);
    }
  }

  List<Player> getPlayersBattingOrder() {
//    database.playerDao.outComparator()  //TODO how should I compare?
    players.sort(PlayerUtils.lineupComparator());
    return players;
  }

  sortPlayersBattingOrder() {
    players.sort(PlayerUtils.lineupComparator());
  }

  @action
  sortTeams(String statToSortBy) {
    teamStatToSortBy = statToSortBy;
    Map<String, Comparator<Team>> comparatorMap = TeamUtils.toComparatorMap();
    if (comparatorMap.containsKey(statToSortBy)) {
      teams.sort(comparatorMap[statToSortBy]);
    } else {
      teams.sort(comparatorMap[TeamUtils.LABEL_WINPCT]);
    }
  }

  @action
  Future addPlayers(int index, Map<int, String> playerNames,
      Map<int, bool> playerGenders) async {
    Team team = teams[index];

    var uuid = new Uuid();
    for (var key in playerNames.keys) {
      Player player = Player(
        firestoreID: uuid.v1(),
        teamfirestoreid: team.firestoreID,
        statkeeperFirestoreID: statkeeperFireID,
        name: playerNames[key],
        gender: (playerGenders[key] ?? false) ? 1 : 0,
        team: team.name,
      );
      await FirestoreService.addPlayer(statkeeperFireID, player);
      await database.playerDao.insertPlayer(player);
//      player.id = await RepositoryServicePlayers.insertPlayer(player);
//      if (player.id > 0) {
//        players.add(player);
//      }
    }
//    players = players;
  }

  @action
  Future addTeams(Map<int, String> teamNames) async {
    var uuid = new Uuid();
    for (var name in teamNames.values) {
      Team team = Team(
        firestoreID: uuid.v1(),
        statkeeperFirestoreID: statkeeperFireID,
        name: name,
      );
      database.teamDao.insertTeam(team);
//      team.id = await RepositoryServiceTeams.insertTeam(team);
//      if (team.id > 0) {
//        teams.add(team);
//      }
    }
//    teams = teams;
  }

  @action
  void clearStatKeeper() {
    statkeeperFireID = null;
    playerStatToUpdate = null;
    playerStatToSortBy = null;
    teamStatToSortBy = null;
    database.teamDao.clear();
    database.playerDao.clear();
    database.playDao.clear();
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

  int getPlayerAmount(int amount) {
    if (amount < 0) {
      return 0;
    } else {
      return amount;
    }
  }

  @action
  Future updatePlayerCountingStat(int index, int amount) async {
    Player player = players[index];
    print(
        "updatePlayerCountingStat  ${player.name}  $index   $playerStatToUpdate   $amount");
    if (playerStatToUpdate != null &&
        PlayerUtils.CHANGEABLE_LABELS.contains(playerStatToUpdate)) {
      switch (playerStatToUpdate) {
        case PlayerUtils.LABEL_R:
          player = player.copyWith(runs: getPlayerAmount(player.runs + amount));
          break;
        case PlayerUtils.LABEL_RBI:
          player = player.copyWith(runs: getPlayerAmount(player.rbis + amount));
          break;
        case PlayerUtils.LABEL_1B:
          player =
              player.copyWith(runs: getPlayerAmount(player.singles + amount));
          break;
        case PlayerUtils.LABEL_2B:
          player =
              player.copyWith(runs: getPlayerAmount(player.doubles + amount));
          break;
        case PlayerUtils.LABEL_3B:
          player =
              player.copyWith(runs: getPlayerAmount(player.triples + amount));
          break;
        case PlayerUtils.LABEL_HR:
          player = player.copyWith(runs: getPlayerAmount(player.hrs + amount));
          break;
        case PlayerUtils.LABEL_OUT:
          player = player.copyWith(runs: getPlayerAmount(player.outs + amount));
          break;
        case PlayerUtils.LABEL_ROE:
          player = player.copyWith(
              runs: getPlayerAmount(player.reachedOnErrors + amount));
          break;
        case PlayerUtils.LABEL_SF:
          player =
              player.copyWith(runs: getPlayerAmount(player.sacFlies + amount));
          break;
        case PlayerUtils.LABEL_BB:
          player =
              player.copyWith(runs: getPlayerAmount(player.walks + amount));
          break;
        case PlayerUtils.LABEL_SB:
          player = player.copyWith(
              runs: getPlayerAmount(player.stolenBases + amount));
          break;
        case PlayerUtils.LABEL_G:
          player =
              player.copyWith(runs: getPlayerAmount(player.games + amount));
          break;
        case PlayerUtils.LABEL_HBP:
          player = player.copyWith(runs: getPlayerAmount(player.hbp + amount));
          break;
        case PlayerUtils.LABEL_K:
          player = player.copyWith(
              runs: getPlayerAmount(player.strikeouts + amount));
          break;
        default:
          print("updatePlayerCountingStat  defaultdefaultdefaultdefault");
          return;
      }
    } else {
      print("updatePlayerCountingStat  elseelseelseelseelseelse");
    }
    database.playerDao.updatePlayer(player);
//    int result = await RepositoryServicePlayers.updatePlayer(player);
//    if (result > 0) {
//      players = players;
//    }
  }

  void toggleShowGender() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    showGender =
        !(sharedPreferences.getBool("$statkeeperFireID-showGender") ?? false);
    sharedPreferences.setBool("$statkeeperFireID-showGender", showGender);
  }

  void updateLineUp() {
    for (final player in players) {
      database.playerDao
          .updatePlayer(player.copyWith(battingOrder: players.indexOf(player)));
    }
  }
}
