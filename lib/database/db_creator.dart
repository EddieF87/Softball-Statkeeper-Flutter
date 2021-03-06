import 'dart:io';

import 'package:path/path.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sqflite/sqflite.dart';

Database db;



class DBCreator {
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult]) {
//    print(functionName);
//    print(sql);
    if (selectQueryResult != null) {
//      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
//      print(insertAndUpdateQueryResult);
    }
  }

//  Future<void> createStatKeepersTable(Database db) async {
//    final statkeeperSql = '''CREATE TABLE ${DBContract.TABLE_STATKEEPERS}
//    (
//   ${DBContract.ID} INTEGER PRIMARY KEY,
//   ${DBContract.FIRESTORE_ID} TEXT NOT NULL UNIQUE,
//   ${DBContract.NAME} TEXT NOT NULL,
//   ${DBContract.TYPE} INTEGER NOT NULL,
//   ${DBContract.LEVEL} INTEGER NOT NULL DEFAULT 1
//    )''';
//    await db.execute(statkeeperSql);
//  }

  Future<void> createTeamsTable(Database db) async {
    final teamSql = '''CREATE TABLE ${DBContract.TABLE_TEAMS}
    (
   ${DBContract.ID} INTEGER PRIMARY KEY,
   ${DBContract.FIRESTORE_ID} TEXT NOT NULL UNIQUE,
   ${DBContract.STATKEEPER_FIRESTORE_ID} TEXT NOT NULL,
   ${DBContract.NAME} TEXT NOT NULL,
   ${DBContract.WINS} INTEGER DEFAULT 0,
   ${DBContract.LOSSES} INTEGER DEFAULT 0,
   ${DBContract.TIES} INTEGER DEFAULT 0,
   ${DBContract.RUNS_SCORED} INTEGER DEFAULT 0,
   ${DBContract.RUNS_ALLOWED} INTEGER DEFAULT 0
    )''';
    await db.execute(teamSql);
  }

  Future<void> createPlayerStatsTable(Database db) async {
    final playerSql = '''CREATE TABLE ${DBContract.TABLE_PLAYERS}
    (
   ${DBContract.ID} INTEGER PRIMARY KEY,
   ${DBContract.FIRESTORE_ID} TEXT NOT NULL UNIQUE,
   ${DBContract.TEAM_FIRESTORE_ID} TEXT,
   ${DBContract.STATKEEPER_FIRESTORE_ID} TEXT,
   ${DBContract.NAME} TEXT NOT NULL,
   ${DBContract.TEAM} TEXT DEFAULT 'FREE AGENT',
   ${DBContract.GENDER} BIT DEFAULT 0,
   ${DBContract.GAMES} INTEGER DEFAULT 0,
   ${DBContract.RUNS} INTEGER DEFAULT 0,
   ${DBContract.RBI} INTEGER DEFAULT 0,
   ${DBContract.SINGLES} INTEGER DEFAULT 0,
   ${DBContract.DOUBLES} INTEGER DEFAULT 0,
   ${DBContract.TRIPLES} INTEGER DEFAULT 0,
   ${DBContract.HRS} INTEGER DEFAULT 0,
   ${DBContract.WALKS} INTEGER DEFAULT 0,
   ${DBContract.OUTS} INTEGER DEFAULT 0,
   ${DBContract.SAC_FLIES} INTEGER DEFAULT 0,
   ${DBContract.REACHED_ON_ERRORS} INTEGER DEFAULT 0,
   ${DBContract.STRIKEOUTS} INTEGER DEFAULT 0,
   ${DBContract.STOLEN_BASES} INTEGER DEFAULT 0,
   ${DBContract.HBP} INTEGER DEFAULT 0,
   ${DBContract.BATTING_ORDER} INTEGER DEFAULT 99
    )''';
    await db.execute(playerSql);
  }

  Future<void> createGameStatsTable(Database db) async {
    final gameStatsSql =
        '''CREATE TABLE IF NOT EXISTS ${DBContract.TABLE_PLAYS} ( 
    ${DBContract.ID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${DBContract.STATKEEPER_FIRESTORE_ID} TEXT NOT NULL,
    ${DBContract.PLAY_NUMBER} INTEGER,
    ${DBContract.PLAY} TEXT,
    ${DBContract.BATTER} TEXT,
    ${DBContract.ON_DECK} TEXT,
    ${DBContract.TEAM} INTEGER,

    ${DBContract.BASE1} TEXT,
    ${DBContract.BASE2} TEXT,
    ${DBContract.BASE3} TEXT,
    ${DBContract.OUTS} INTEGER,
    ${DBContract.AWAY_RUNS} INTEGER,
    ${DBContract.HOME_RUNS} INTEGER,

    ${DBContract.RUN1} TEXT,
    ${DBContract.RUN2} TEXT,
    ${DBContract.RUN3} TEXT,
    ${DBContract.RUN4} TEXT,

    ${DBContract.INNING_CHANGED} INTEGER,
    ${DBContract.INNINGS} INTEGER,
    ${DBContract.INNING_RUNS} INTEGER DEFAULT 0
    )''';
    await db.execute(gameStatsSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    if (await Directory(dirname(path)).exists()) {
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath("test_db");
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
//    await createStatKeepersTable(db);
    await createTeamsTable(db);
    await createPlayerStatsTable(db);
    await createGameStatsTable(db);
  }
}
