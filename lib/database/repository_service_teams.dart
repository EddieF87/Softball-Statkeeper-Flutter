import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';

class RepositoryServiceTeams {
  static Future<List<Team>> getAllTeams(String statkeeperFireID) async {
    final data = await queryTeamDB(
        statkeeperFireID, DBContract.STATKEEPER_FIRESTORE_ID);
    List<Team> teamsList = [];
    for (final node in data) {
      final playerStats = Team.fromJson(node);
      teamsList.add(playerStats);
    }
    return teamsList;
  }

  static Future<Team> getTeam(String fireID) async {
    final data = await queryTeamDB(fireID, DBContract.FIRESTORE_ID);
    return Team.fromJson(data[0]);
  }

  static Future<List<Map<String, dynamic>>> queryTeamDB(
      String id, String query) async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_TEAMS} WHERE $query=?''';
    List<String> params = [id];
    return await db.rawQuery(sql, params);
  }

  static Future<int> insertTeam(Team team) async {
    final sql = '''INSERT OR REPLACE INTO ${DBContract.TABLE_TEAMS}
    ( 
    ${DBContract.FIRESTORE_ID},
    ${DBContract.STATKEEPER_FIRESTORE_ID},
    ${DBContract.NAME},
    ${DBContract.WINS},
    ${DBContract.LOSSES},
    ${DBContract.TIES},
    ${DBContract.RUNS_SCORED},
    ${DBContract.RUNS_ALLOWED}
    )
    VALUES
    (?, ?, ?, ?, ?, ?, ?, ?)
    ''';
    List<dynamic> params = [
      team.fireID,
      team.statkeeperFireID,
      team.name,
      team.wins,
      team.losses,
      team.ties,
      team.runsScored,
      team.runsAllowed
    ];

    return await db.rawInsert(sql, params);
//    DBCreator.databaseLog("Add Team", sql, null, result);
  }

  static Future<void> deleteTeam(Team team) async {
    final sql =
        '''DELETE ${DBContract.TABLE_TEAMS} WHERE ${DBContract.FIRESTORE_ID}=?''';
    List<String> params = [team.fireID];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete Team", sql, null, result);
  }

  static Future<void> updateTeam(Team team) async {
    final sql = '''UPDATE ${DBContract.TABLE_TEAMS} 
    SET ${DBContract.NAME} = ${team.name},
    ${DBContract.WINS} = ${team.wins},
    ${DBContract.LOSSES} = ${team.losses},
    ${DBContract.TIES} = ${team.ties},
    ${DBContract.RUNS_SCORED} = ${team.runsScored},
    ${DBContract.RUNS_ALLOWED} = ${team.runsAllowed}
    WHERE ${DBContract.FIRESTORE_ID} =?
    ''';

    List<String> params = [team.fireID];
    final result = await db.rawUpdate(sql, params);
    DBCreator.databaseLog("Update Team", sql, null, result);
  }

  static Future<int> teamCount() async {
    final sql = '''SELECT COUNT(*) FROM ${DBContract.TABLE_TEAMS}''';
    final data = await db.rawQuery(sql);

    int count = data[0].values.elementAt(0);
    return count;
  }

  ///Insert newly created team into repository based off newly created SK
  static onNewTeamStatKeeper({String name, String fireID}) {
    insertTeam(Team(
        fireID: fireID,
        statkeeperFireID: fireID,
        name: name));
  }
}
