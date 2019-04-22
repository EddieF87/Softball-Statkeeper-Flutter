import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';

class RepositoryServiceTeams {
  static Future<List<Team>> getAllTeams() async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_TEAMS}''';
    final data = await db.rawQuery(sql);

    List<Team> teamList = [];
    for (final node in data) {
      final team = Team.fromJson(node);
      teamList.add(team);
    }
    return teamList;
  }

  static Future<Team> getTeam(String firestoreID) async {
    final sql = '''
    SELECT * FROM ${DBContract.TABLE_TEAMS} WHERE ${DBContract.FIRESTORE_ID}=?
    ''';
    List<String> params = [firestoreID];
    final data = await db.rawQuery(sql, params);
    final team = Team.fromJson(data[0]);
    print("retrieved team = ${team.toString()}");
    return team;
  }

  static Future<void> insertTeam(Team team) async {
    final sql = '''INSERT INTO ${DBContract.TABLE_TEAMS}
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
      team.firestoreID,
      team.statkeeperFirestoreID,
      team.name,
      team.wins,
      team.losses,
      team.ties,
      team.runsScored,
      team.runsAllowed
    ];

    final result = await db.rawInsert(sql, params);
    DBCreator.databaseLog("Add Team", sql, null, result);
  }

  static Future<void> deleteTeam(Team team) async {
    final sql =
        '''DELETE ${DBContract.TABLE_TEAMS} WHERE ${DBContract.FIRESTORE_ID}=?''';
    List<String> params = [team.firestoreID];
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

    List<String> params = [team.firestoreID];
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
  static onNewTeamStatKeeper({String name, String firestoreID}) {
    insertTeam(Team(
        firestoreID: firestoreID,
        statkeeperFirestoreID: firestoreID,
        name: name));
  }
}
