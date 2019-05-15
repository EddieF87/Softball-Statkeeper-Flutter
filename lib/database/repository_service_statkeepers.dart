import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';

class RepositoryServiceStatKeepers {
  static Future<List<StatKeeper>> getAllStatKeepers() async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_STATKEEPERS}''';
    final data = await db.rawQuery(sql);

    List<StatKeeper> statKeeperList = [];
    for (final node in data) {
      final statKeeper = StatKeeper.fromJson(node);
      statKeeperList.add(statKeeper);
    }
    return statKeeperList;
  }

  static Future<StatKeeper> getStatKeeper(String fireID) async {
    final sql = '''
    SELECT * FROM ${DBContract.TABLE_STATKEEPERS} WHERE ${DBContract.FIRESTORE_ID}=?
    ''';
    List<String> params = [fireID];
    final data = await db.rawQuery(sql, params);
    final statKeeper = StatKeeper.fromJson(data[0]);
    return statKeeper;
  }

  static Future<int> insertStatKeeper(StatKeeper statKeeper) async {
    final sql = '''INSERT INTO ${DBContract.TABLE_STATKEEPERS}
    ( 
    ${DBContract.FIRESTORE_ID},
    ${DBContract.TYPE},
    ${DBContract.NAME},
    ${DBContract.LEVEL}
    )
    VALUES
    (?, ?, ?, ?)
    ''';
    List<dynamic> params = [
      statKeeper.fireID,
      statKeeper.type,
      statKeeper.name,
      statKeeper.level
    ];
    switch (statKeeper.type) {
      case StatKeeper.TYPE_PLAYER:
        await RepositoryServicePlayers.onNewPlayerStatKeeper(
          name: statKeeper.name,
          fireID: statKeeper.fireID,
        );
        break;
      case StatKeeper.TYPE_TEAM:
        await RepositoryServiceTeams.onNewTeamStatKeeper(
          name: statKeeper.name,
          fireID: statKeeper.fireID,
        );
        break;
      case StatKeeper.TYPE_LEAGUE:
        break;
      default:
        return -1;
    }
    final int result = await db.rawInsert(sql, params);
    DBCreator.databaseLog("Add StatKeeper", sql, null, result);
    return result;
  }

  static Future<int> deleteStatKeeper(StatKeeper statKeeper) async {
    final sql =
        '''DELETE ${DBContract.TABLE_STATKEEPERS} WHERE ${DBContract.FIRESTORE_ID}=?''';
    List<String> params = [statKeeper.fireID];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete StatKeeper", sql, null, result);
    return result;
  }

  static Future<int> updateStatKeeper(StatKeeper statKeeper) async {
    final sql = '''UPDATE ${DBContract.TABLE_STATKEEPERS} 
    SET ${DBContract.NAME} = ${statKeeper.name},
    ${DBContract.LEVEL} = ${statKeeper.level}
    WHERE ${DBContract.FIRESTORE_ID} =?
    ''';

    List<String> params = [statKeeper.fireID];
    final result = await db.rawUpdate(sql, params);
    DBCreator.databaseLog("Update StatKeeper", sql, null, result);
    return result;
  }

  static Future<int> statkeeperCount() async {
    final sql = '''SELECT COUNT(*) FROM ${DBContract.TABLE_STATKEEPERS}''';
    final data = await db.rawQuery(sql);

    int count = data[0].values.elementAt(0);
    return count;
  }
}
