import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_creator.dart';
import 'package:sleekstats_flutter_statkeeper/model/play.dart';

class RepositoryServicePlays {
  static Future<List<Play>> getAllPlays(String statkeeperFireID) async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_PLAYS} 
    WHERE ${DBContract.STATKEEPER_FIRESTORE_ID}=?''';
    List<String> params = [statkeeperFireID];
    final data = await db.rawQuery(sql, params);
    List<Play> playsList = [];
    for (final node in data) {
      final play = Play.fromJson(node);
      playsList.add(play);
    }
    return playsList;
  }

  static Future<Play> getPlay(String statkeeperFireID, int playNumber) async {
    final sql = '''SELECT * FROM ${DBContract.TABLE_PLAYS} 
    WHERE ${DBContract.STATKEEPER_FIRESTORE_ID}=? AND ${DBContract.PLAY_NUMBER}=?''';
    List<String> params = [statkeeperFireID, playNumber.toString()];
    final data = await db.rawQuery(sql, params);
    return Play.fromJson(data[0]);
  }

  static Future<int> insertPlay(Play play) async {
    final sql = '''INSERT INTO ${DBContract.TABLE_PLAYS}
    ( 
    ${DBContract.ID},
    ${DBContract.STATKEEPER_FIRESTORE_ID},
    ${DBContract.PLAY_NUMBER},
    ${DBContract.PLAY},
    ${DBContract.BATTER},
    ${DBContract.ON_DECK},
    ${DBContract.TEAM},
    ${DBContract.BASE1},
    ${DBContract.BASE2},
    ${DBContract.BASE3},
    ${DBContract.OUTS},
    ${DBContract.AWAY_RUNS},
    ${DBContract.HOME_RUNS},
    ${DBContract.RUN1},
    ${DBContract.RUN2},
    ${DBContract.RUN3},
    ${DBContract.RUN4},
    ${DBContract.INNING_CHANGED},
    ${DBContract.INNINGS},
    ${DBContract.INNING_RUNS}
    )
    VALUES
    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''';
    List<dynamic> params = [
      play.id,
      play.statkeeperFireID,
      play.number,
      play.play,
      play.batterID,
      play.onDeckID,
      play.team,
      play.bases[1],
      play.bases[2],
      play.bases[3],
      play.outs,
      play.awayTeamRuns,
      play.homeTeamRuns,
      play.runsScored[0],
      play.runsScored[1],
      play.runsScored[2],
      play.runsScored[3],
      play.inningChanged,
      play.innings,
      play.inningRuns
    ];
    DBCreator.databaseLog("Add Play", sql, null, 0);
    final result = await db.rawInsert(sql, params);
    return result;
  }

  static Future<void> deletePlay(Play play) async {
    final sql = '''DELETE FROM ${DBContract.TABLE_PLAYS} WHERE ${DBContract.ID}=?''';
    List<String> params = [play.id.toString()];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete Play", sql, null, result);
  }

  static Future<void> resetPlays(String statkeeperFireID) async {
    final sql = '''DELETE FROM ${DBContract.TABLE_PLAYS} 
        WHERE ${DBContract.STATKEEPER_FIRESTORE_ID}=?''';
    List<String> params = [statkeeperFireID];
    final result = await db.rawDelete(sql, params);
    DBCreator.databaseLog("Delete Plays", sql, null, result);
  }

  static Future<int> playCount() async {
    final sql = '''SELECT COUNT(*) FROM ${DBContract.TABLE_PLAYS}''';
    final data = await db.rawQuery(sql);

    int count = data[0].values.elementAt(0);
    return count;
  }
}
