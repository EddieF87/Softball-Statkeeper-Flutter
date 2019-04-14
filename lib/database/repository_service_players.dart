import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class RepositoryServicePlayers {
  static Future<List<Player>> getAllPlayers() async {
    final sql = '''SELECT * FROM ${DBContract.playersTable}''';
    final data = await db.rawQuery(sql);

    List<Player> playerStatsList = [];
    for (final node in data) {
      final playerStats = Player.fromJson(node);
      playerStatsList.add(playerStats);
    }
    return playerStatsList;
  }

  static Future<Player> getPlayer(String firestoreID) async {
    final sql = '''
    SELECT * FROM ${DBContract.playersTable} WHERE ${DBContract.firestoreID}=?
    ''';
    List<String> params = [firestoreID];
    final data = await db.rawQuery(sql, params);
    final playerStats = Player.fromJson(data[0]);
    return playerStats;
  }

  static Future<void> insertPlayer(Player player) async {
    final sql = '''INSERT INTO ${DBContract.playersTable}
    ( 
    ${DBContract.id},
    ${DBContract.firestoreID},
    ${DBContract.teamFirestoreID},
    ${DBContract.name},
    ${DBContract.team},
    ${DBContract.gender},
    ${DBContract.games},
    ${DBContract.runs},
    ${DBContract.rbi},
    ${DBContract.singles},
    ${DBContract.doubles},
    ${DBContract.triples},
    ${DBContract.hrs},
    ${DBContract.walks},
    ${DBContract.outs},
    ${DBContract.sacFlies},
    ${DBContract.reachedOnErrors},
    ${DBContract.strikeOuts},
    ${DBContract.stolenBases},
    ${DBContract.hbp}
    )
    VALUES
    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';
    List<dynamic> params = [
      player.id,
      player.firestoreID,
      player.teamFirestoreID,
      player.name,
      player.team,
      player.gender,
      player.games,
      player.runs,
      player.rbi,
      player.singles,
      player.doubles,
      player.triples,
      player.hrs,
      player.walks,
      player.outs,
      player.sacFlies,
      player.reachedOnErrors,
      player.strikeOuts,
      player.stolenBases,
      player.hbp
    ];

    final result = await db.rawInsert(sql, params);
    DBCreator.databaseLog("Add Player", sql, null, result);
  }

  static Future<void> deletePlayer(Player player) async {
    final sql =
        '''DELETE ${DBContract.playersTable} WHERE ${DBContract.id}=?''';
    List<String> params = [player.id.toString()];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete Player", sql, null, result);
  }

  static Future<void> updatePlayer(Player player) async {
    final sql = '''UPDATE ${DBContract.playersTable} 
    SET ${DBContract.games} = ${player.games},
    ${DBContract.runs} = ${player.runs},
    ${DBContract.rbi} = ${player.rbi},
    ${DBContract.singles} = ${player.singles},
    ${DBContract.doubles} = ${player.doubles},
    ${DBContract.triples} = ${player.triples},
    ${DBContract.hrs} = ${player.hrs},
    ${DBContract.walks} = ${player.walks},
    ${DBContract.outs} = ${player.outs},
    ${DBContract.sacFlies} = ${player.sacFlies},
    ${DBContract.reachedOnErrors} = ${player.reachedOnErrors},
    ${DBContract.strikeOuts} = ${player.strikeOuts},
    ${DBContract.stolenBases} = ${player.stolenBases},
    ${DBContract.hbp} = ${player.hbp}
    WHERE ${DBContract.id} =?
    ''';

    List<String> params = [player.id.toString()];
    final result = await db.rawUpdate(sql, params);
    DBCreator.databaseLog("Update Player", sql, null, result);
  }

  static Future<int> playerCount() async {
    final sql = '''SELECT COUNT(*) FROM ${DBContract.playersTable}''';
    final data = await db.rawQuery(sql);

    int count = data[0].values.elementAt(0);
    return count;
  }
}
