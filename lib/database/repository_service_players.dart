import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class RepositoryServicePlayers {
  static Future<List<Player>> getAllPlayers(
      String statKeeperFirestoreID) async {
    final sql = '''SELECT * FROM${DBContract.TABLE_PLAYERS} 
    WHERE ${DBContract.STATKEEPER_FIRESTORE_ID}=?''';

    List<String> params = [statKeeperFirestoreID];
    final data = await db.rawQuery(sql, params);

    List<Player> playerStatsList = [];
    for (final node in data) {
      final playerStats = Player.fromJson(node);
      playerStatsList.add(playerStats);
    }
    return playerStatsList;
  }

  static Future<List<Player>> getAllPlayersFromTeam(
      String statkeeperFirestoreID, String teamFirestoreID) async {

    final sql = '''SELECT * FROM ${DBContract.TABLE_PLAYERS} 
    WHERE ${DBContract.STATKEEPER_FIRESTORE_ID}=? 
    AND ${DBContract.TEAM_FIRESTORE_ID}=?''';

    List<String> params = [statkeeperFirestoreID, teamFirestoreID];
    final data = await db.rawQuery(sql, params);

    List<Player> playerStatsList = [];
    for (final node in data) {
      final playerStats = Player.fromJson(node);
      print(playerStats);
      playerStatsList.add(playerStats);
    }
    return playerStatsList;
  }

  static Future<Player> getPlayer(
      String statKeeperFirestoreID, String firestoreID) async {

    final sql = '''SELECT * FROM ${DBContract.TABLE_PLAYERS} WHERE 
    ${DBContract.STATKEEPER_FIRESTORE_ID}=? AND ${DBContract.FIRESTORE_ID}=?''';

    List<String> params = [statKeeperFirestoreID, firestoreID];
    final data = await db.rawQuery(sql, params);

    return Player.fromJson(data[0]);
  }

  static Future<List<Map<String, dynamic>>> queryPlayerDB(
      String statKeeperFirestoreID, String id, String query) async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_PLAYERS} WHERE 
    ${DBContract.STATKEEPER_FIRESTORE_ID}=? AND $query=?''';
    List<String> params = [statKeeperFirestoreID, id];
    return await db.rawQuery(sql, params);
  }

  static Future<void> insertPlayer(Player player) async {
    final sql = '''INSERT INTO ${DBContract.TABLE_PLAYERS}
    ( 
    ${DBContract.ID},
    ${DBContract.FIRESTORE_ID},
    ${DBContract.TEAM_FIRESTORE_ID},
    ${DBContract.STATKEEPER_FIRESTORE_ID},
    ${DBContract.NAME},
    ${DBContract.TEAM},
    ${DBContract.GENDER},
    ${DBContract.GAMES},
    ${DBContract.RUNS},
    ${DBContract.RBI},
    ${DBContract.SINGLES},
    ${DBContract.DOUBLES},
    ${DBContract.TRIPLES},
    ${DBContract.HRS},
    ${DBContract.WALKS},
    ${DBContract.OUTS},
    ${DBContract.SAC_FLIES},
    ${DBContract.REACHED_ON_ERRORS},
    ${DBContract.STRIKEOUTS},
    ${DBContract.STOLEN_BASES},
    ${DBContract.HBP}
    )
    VALUES
    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';
    List<dynamic> params = [
      player.id,
      player.firestoreID,
      player.teamFirestoreID,
      player.statkeeperFirestoreID,
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
        '''DELETE ${DBContract.TABLE_PLAYERS} WHERE ${DBContract.ID}=?''';
    List<String> params = [player.id.toString()];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete Player", sql, null, result);
  }

  static Future<void> updatePlayer(Player player) async {
    final sql = '''UPDATE ${DBContract.TABLE_PLAYERS} 
    SET ${DBContract.GAMES} = ${player.games},
    ${DBContract.RUNS} = ${player.runs},
    ${DBContract.RBI} = ${player.rbi},
    ${DBContract.SINGLES} = ${player.singles},
    ${DBContract.DOUBLES} = ${player.doubles},
    ${DBContract.TRIPLES} = ${player.triples},
    ${DBContract.HRS} = ${player.hrs},
    ${DBContract.WALKS} = ${player.walks},
    ${DBContract.OUTS} = ${player.outs},
    ${DBContract.SAC_FLIES} = ${player.sacFlies},
    ${DBContract.REACHED_ON_ERRORS} = ${player.reachedOnErrors},
    ${DBContract.STRIKEOUTS} = ${player.strikeOuts},
    ${DBContract.STOLEN_BASES} = ${player.stolenBases},
    ${DBContract.HBP} = ${player.hbp}
    WHERE ${DBContract.ID} =?
    ''';

    print("player id =  ${player.id}");
    List<String> params = [player.id.toString()];
    final result = await db.rawUpdate(sql, params);
    DBCreator.databaseLog("Update Player", sql, null, result);
  }

  static Future<int> playerCount() async {
    final sql = '''SELECT COUNT(*) FROM ${DBContract.TABLE_PLAYERS}''';
    final data = await db.rawQuery(sql);

    int count = data[0].values.elementAt(0);
    return count;
  }

  ///Insert newly created player into repository based off newly created SK
  static onNewPlayerStatKeeper({String name, String firestoreID}) async {
    insertPlayer(Player(
      firestoreID: firestoreID,
      statkeeperFirestoreID: firestoreID,
      name: name,
    ));
  }
}
