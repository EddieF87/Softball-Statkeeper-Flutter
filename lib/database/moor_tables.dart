import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:sleekstats_flutter_statkeeper/database/native_db_creator.dart'
    if (dart.library.html) 'package:sleekstats_flutter_statkeeper/database/web_db_creator.dart'
    as db_creator;

part 'moor_tables.g.dart';

const zero = const Constant(0);

class StatKeepers extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get firestoreID => text()();

  TextColumn get name => text()();

  IntColumn get type => integer()();

  IntColumn get level => integer().withDefault(const Constant(1))();
}

class Teams extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get firestoreID => text()();

  TextColumn get statkeeperFirestoreID => text()();

  TextColumn get name => text()();

  IntColumn get wins => integer().nullable().withDefault(zero)();

  IntColumn get losses => integer().nullable().withDefault(zero)();

  IntColumn get ties => integer().nullable().withDefault(zero)();

  IntColumn get totalRunsScored => integer().nullable().withDefault(zero)();

  IntColumn get totalRunsAllowed => integer().nullable().withDefault(zero)();
}

class Players extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get firestoreID => text()();

  TextColumn get teamfirestoreid => text()();

  TextColumn get statkeeperFirestoreID => text()();

  TextColumn get name => text()();

  TextColumn get team =>
      text().nullable().withDefault(const Constant("Free Agent"))();

  IntColumn get gender => integer().nullable().withDefault(zero)();

  IntColumn get games => integer().nullable().withDefault(zero)();

  IntColumn get runs => integer().nullable().withDefault(zero)();

  IntColumn get rbis => integer().nullable().withDefault(zero)();

  IntColumn get singles => integer().nullable().withDefault(zero)();

  IntColumn get doubles => integer().nullable().withDefault(zero)();

  IntColumn get triples => integer().nullable().withDefault(zero)();

  IntColumn get hrs => integer().nullable().withDefault(zero)();

  IntColumn get walks => integer().nullable().withDefault(zero)();

  IntColumn get outs => integer().nullable().withDefault(zero)();

  IntColumn get sacFlies => integer().nullable().withDefault(zero)();

  IntColumn get reachedOnErrors => integer().nullable().withDefault(zero)();

  IntColumn get strikeouts => integer().nullable().withDefault(zero)();

  IntColumn get stolenBases => integer().nullable().withDefault(zero)();

  IntColumn get hbp => integer().nullable().withDefault(zero)();

  IntColumn get battingOrder =>
      integer().nullable().withDefault(const Constant(99))();
}

class Plays extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get statkeeperFirestoreID => text()();

  IntColumn get number => integer()();

  TextColumn get play => text()();

  TextColumn get batter => text()();

  TextColumn get ondeck => text()();

  IntColumn get team => integer()();

  TextColumn get base_1 => text()();

  TextColumn get base_2 => text()();

  TextColumn get base_3 => text()();

  IntColumn get outs => integer()();

  IntColumn get awayteam_runs => integer()();

  IntColumn get hometeam_runs => integer()();

  TextColumn get run1 => text()();

  TextColumn get run2 => text()();

  TextColumn get run3 => text()();

  TextColumn get run4 => text()();

  IntColumn get inn_changed => integer()();

  IntColumn get total_inns => integer()();

  IntColumn get inn_runs => integer().withDefault(zero)();
}

@UseMoor(
    tables: [StatKeepers, Teams, Players, Plays],
    daos: [StatKeeperDao, TeamDao, PlayerDao, PlayDao])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase(QueryExecutor e) : super(e);

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  void clear() {
    statKeeperDao.clear();
    playerDao.clear();
    teamDao.clear();
    playDao.clear();
  }
}

MyDatabase constructDb() => db_creator.constructDb();

@UseDao(tables: [StatKeepers])
class StatKeeperDao extends DatabaseAccessor<MyDatabase>
    with _$StatKeeperDaoMixin {
  final MyDatabase db;

  StatKeeperDao(this.db) : super(db);

  Future<List<StatKeeper>> getAllStatKeepers() => select(statKeepers).get();

  Stream<List<StatKeeper>> watchAllStatKeepers() => select(statKeepers).watch();

  Future<List<StatKeeper>> getStatKeeper(String firestoreID) =>
      (select(statKeepers)
            ..where((statKeeper) => statKeeper.firestoreID.equals(firestoreID)))
          .get();

  Future insertStatKeeper(StatKeeper statKeeper) =>
      into(statKeepers).insert(statKeeper);

  Future deleteStatKeeper(StatKeeper statKeeper) =>
      delete(statKeepers).delete(statKeeper);

  Future updateStatKeeper(StatKeeper statKeeper) =>
      update(statKeepers).replace(statKeeper);

  Future clear() => delete(statKeepers).go();

//TODO
//  Future resetStatKeepers(String statkeeperFireID) => delete(statKeepers)..where((tbl) => tbl.statkeeperFirestoreID.equals(statkeeperFireID));
}

@UseDao(tables: [Teams])
class TeamDao extends DatabaseAccessor<MyDatabase> with _$TeamDaoMixin {
  final MyDatabase db;

  TeamDao(this.db) : super(db);

  Future<List<Team>> getAllTeams(String statkeeperFireID) => (select(teams)
        ..where((tbl) => tbl.statkeeperFirestoreID.equals(statkeeperFireID)))
      .get();

  Stream<List<Team>> watchAllTeams() => select(teams).watch();

  Future<List<Team>> getTeam(String statkeeperFireID, String firestoreID) =>
      (select(teams)
            ..where(
                (team) => team.statkeeperFirestoreID.equals(statkeeperFireID)))
          .get();

  Future insertTeam(Team team) => into(teams).insert(team);

  Future deleteTeam(Team team) => delete(teams).delete(team);

  Future updatePlayer(Team team) => update(teams).replace(team);

  Future clear() => delete(teams).go();

//TODO
//  Future resetTeams(String statkeeperFireID) => delete(teams)..where((tbl) => tbl.statkeeperFirestoreID.equals(statkeeperFireID));
}

@UseDao(tables: [Players])
class PlayerDao extends DatabaseAccessor<MyDatabase> with _$PlayerDaoMixin {
  final MyDatabase db;

  PlayerDao(this.db) : super(db);

  Future<List<Player>> getAllPlayers() =>
      select(players).get(); //TODO remove this one?

  Future<List<Player>> getPlayer(String statKeeperID, String firestoreID) =>
      (select(players)
            ..where((player) =>
                player.statkeeperFirestoreID.equals(statKeeperID) &
                player.firestoreID.equals(firestoreID)))
          .get();

  Future<List<Player>> getAllPlayersFromTeam(
          String statKeeperID, String teamfirestoreid) =>
      (select(players)
            ..where((player) =>
                player.statkeeperFirestoreID.equals(statKeeperID) &
                player.teamfirestoreid.equals(teamfirestoreid)))
          .get();

  Future<List<Player>> getAllPlayersFromStatKeeper(String statKeeperID) =>
      (select(players)
            ..where(
                (player) => player.statkeeperFirestoreID.equals(statKeeperID)))
          .get();

  Stream<Player> watchPlayer(String firestoreID) => (select(players)
        ..limit(1)
        ..where((player) => player.firestoreID.equals(firestoreID)))
      .watchSingle();

  Future<Player> tttttttt() => (select(players)
        ..limit(1)
        ..where((player) =>
            player.statkeeperFirestoreID.equals("8vaF9y1lR4CPga4K9krt")))
      .getSingle();

  Stream<List<Player>> watchAllPlayers() => select(players).watch();

  Future insertPlayer(Player player) => into(players).insert(player);

  Future updatePlayer(Player player) => update(players).replace(player);

  Future deletePlayer(Player player) => delete(players).delete(player);

  Future clear() => delete(players).go();

  Future<List<Player>> nameComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.name)]))
          .get();

  Future<List<Player>> teamComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.team)]))
          .get();

  Future<List<Player>> gameComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.games)]))
          .get();

  Future<List<Player>> rbiComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.rbis)]))
          .get();

  Future<List<Player>> runComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.runs)]))
          .get();

  Future<List<Player>> singleComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.singles)]))
          .get();

  Future<List<Player>> doubleComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.doubles)]))
          .get();

  Future<List<Player>> tripleComparator() =>
      (select(players)..orderBy([(t) => OrderingTerm(expression: t.triples)]))
          .get();

  Future<List<Player>> hrComparator() => (select(players)
        ..orderBy([
          (t) {
            return OrderingTerm(expression: t.hrs);
          }
        ]))
      .get();

  Future<List<Player>> outComparator(Expression sortBy) {
    return (select(players)..orderBy([(t) => OrderingTerm(expression: sortBy)]))
        .get();
  }
}

@UseDao(tables: [Plays])
class PlayDao extends DatabaseAccessor<MyDatabase> with _$PlayDaoMixin {
  final MyDatabase db;

  PlayDao(this.db) : super(db);

  Future<List<Play>> getAllPlays() => select(plays).get();

  Future<List<Play>> getPlay(String statkeeperFireID, int playNumber) =>
      (select(plays)
            ..where((play) =>
                play.statkeeperFirestoreID.equals(statkeeperFireID) &
                play.number.equals(playNumber)))
          .get();

  Future insertPlay(Play play) => into(plays).insert(play);

  Future deletePlay(Play play) => delete(plays).delete(play);

  Future clear() => delete(plays).go();

//TODO
//  Future resetPlays(String statkeeperFireID) => delete(plays)..where((tbl) => tbl.statkeeperFirestoreID.equals(statkeeperFireID));
}
