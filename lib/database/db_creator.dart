import 'dart:io';

import 'package:path/path.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sqflite/sqflite.dart';

Database db;

class DBCreator {


  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult]) {
    print(functionName);
    print(sql);
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createPlayerStatsTable(Database db) async {
    final playerSql = '''CREATE TABLE ${DBContract.playersTable}
    (
   ${DBContract.id} INTEGER PRIMARY KEY,
   ${DBContract.firestoreID} TEXT,
   ${DBContract.teamFirestoreID} TEXT,
   ${DBContract.name} TEXT,
   ${DBContract.team} TEXT,
   ${DBContract.gender} BIT DEFAULT 0,
   ${DBContract.games} INTEGER DEFAULT 0,
   ${DBContract.runs} INTEGER DEFAULT 0,
   ${DBContract.rbi} INTEGER DEFAULT 0,
   ${DBContract.singles} INTEGER DEFAULT 0,
   ${DBContract.doubles} INTEGER DEFAULT 0,
   ${DBContract.triples} INTEGER DEFAULT 0,
   ${DBContract.hrs} INTEGER DEFAULT 0,
   ${DBContract.walks} INTEGER DEFAULT 0,
   ${DBContract.outs} INTEGER DEFAULT 0,
   ${DBContract.sacFlies} INTEGER DEFAULT 0,
   ${DBContract.reachedOnErrors} INTEGER DEFAULT 0,
   ${DBContract.strikeOuts} INTEGER DEFAULT 0,
   ${DBContract.stolenBases} INTEGER DEFAULT 0,
   ${DBContract.hbp} INTEGER DEFAULT 0
    )''';
    await db.execute(playerSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if(await Directory(dirname(path)).exists()){

    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath("playerstats_db");
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createPlayerStatsTable(db);
  }
}
