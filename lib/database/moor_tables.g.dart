// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class StatKeeper extends DataClass implements Insertable<StatKeeper> {
  final int id;
  final String firestoreID;
  final String name;
  final int type;
  final int level;
  StatKeeper(
      {this.id,
      @required this.firestoreID,
      @required this.name,
      @required this.type,
      @required this.level});
  factory StatKeeper.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return StatKeeper(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      firestoreID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firestore_i_d']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      type: intType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      level: intType.mapFromDatabaseResponse(data['${effectivePrefix}level']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || firestoreID != null) {
      map['firestore_i_d'] = Variable<String>(firestoreID);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<int>(type);
    }
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<int>(level);
    }
    return map;
  }

  StatKeepersCompanion toCompanion(bool nullToAbsent) {
    return StatKeepersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      firestoreID: firestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
    );
  }

  factory StatKeeper.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return StatKeeper(
      id: serializer.fromJson<int>(json['id']),
      firestoreID: serializer.fromJson<String>(json['firestoreID']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<int>(json['type']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firestoreID': serializer.toJson<String>(firestoreID),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(type),
      'level': serializer.toJson<int>(level),
    };
  }

  StatKeeper copyWith(
          {int id, String firestoreID, String name, int type, int level}) =>
      StatKeeper(
        id: id ?? this.id,
        firestoreID: firestoreID ?? this.firestoreID,
        name: name ?? this.name,
        type: type ?? this.type,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('StatKeeper(')
          ..write('id: $id, ')
          ..write('firestoreID: $firestoreID, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(firestoreID.hashCode,
          $mrjc(name.hashCode, $mrjc(type.hashCode, level.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is StatKeeper &&
          other.id == this.id &&
          other.firestoreID == this.firestoreID &&
          other.name == this.name &&
          other.type == this.type &&
          other.level == this.level);
}

class StatKeepersCompanion extends UpdateCompanion<StatKeeper> {
  final Value<int> id;
  final Value<String> firestoreID;
  final Value<String> name;
  final Value<int> type;
  final Value<int> level;
  const StatKeepersCompanion({
    this.id = const Value.absent(),
    this.firestoreID = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.level = const Value.absent(),
  });
  StatKeepersCompanion.insert({
    this.id = const Value.absent(),
    @required String firestoreID,
    @required String name,
    @required int type,
    this.level = const Value.absent(),
  })  : firestoreID = Value(firestoreID),
        name = Value(name),
        type = Value(type);
  static Insertable<StatKeeper> custom({
    Expression<int> id,
    Expression<String> firestoreID,
    Expression<String> name,
    Expression<int> type,
    Expression<int> level,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firestoreID != null) 'firestore_i_d': firestoreID,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (level != null) 'level': level,
    });
  }

  StatKeepersCompanion copyWith(
      {Value<int> id,
      Value<String> firestoreID,
      Value<String> name,
      Value<int> type,
      Value<int> level}) {
    return StatKeepersCompanion(
      id: id ?? this.id,
      firestoreID: firestoreID ?? this.firestoreID,
      name: name ?? this.name,
      type: type ?? this.type,
      level: level ?? this.level,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firestoreID.present) {
      map['firestore_i_d'] = Variable<String>(firestoreID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    return map;
  }
}

class $StatKeepersTable extends StatKeepers
    with TableInfo<$StatKeepersTable, StatKeeper> {
  final GeneratedDatabase _db;
  final String _alias;
  $StatKeepersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _firestoreIDMeta =
      const VerificationMeta('firestoreID');
  GeneratedTextColumn _firestoreID;
  @override
  GeneratedTextColumn get firestoreID =>
      _firestoreID ??= _constructFirestoreID();
  GeneratedTextColumn _constructFirestoreID() {
    return GeneratedTextColumn(
      'firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _levelMeta = const VerificationMeta('level');
  GeneratedIntColumn _level;
  @override
  GeneratedIntColumn get level => _level ??= _constructLevel();
  GeneratedIntColumn _constructLevel() {
    return GeneratedIntColumn('level', $tableName, false,
        defaultValue: const Constant(1));
  }

  @override
  List<GeneratedColumn> get $columns => [id, firestoreID, name, type, level];
  @override
  $StatKeepersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stat_keepers';
  @override
  final String actualTableName = 'stat_keepers';
  @override
  VerificationContext validateIntegrity(Insertable<StatKeeper> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('firestore_i_d')) {
      context.handle(
          _firestoreIDMeta,
          firestoreID.isAcceptableOrUnknown(
              data['firestore_i_d'], _firestoreIDMeta));
    } else if (isInserting) {
      context.missing(_firestoreIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level'], _levelMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatKeeper map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return StatKeeper.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StatKeepersTable createAlias(String alias) {
    return $StatKeepersTable(_db, alias);
  }
}

class Team extends DataClass implements Insertable<Team> {
  final int id;
  final String firestoreID;
  final String statkeeperFirestoreID;
  final String name;
  final int wins;
  final int losses;
  final int ties;
  final int totalRunsScored;
  final int totalRunsAllowed;
  Team(
      {this.id,
      @required this.firestoreID,
      @required this.statkeeperFirestoreID,
      @required this.name,
      this.wins,
      this.losses,
      this.ties,
      this.totalRunsScored,
      this.totalRunsAllowed});
  factory Team.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Team(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      firestoreID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firestore_i_d']),
      statkeeperFirestoreID: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}statkeeper_firestore_i_d']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      wins: intType.mapFromDatabaseResponse(data['${effectivePrefix}wins']),
      losses: intType.mapFromDatabaseResponse(data['${effectivePrefix}losses']),
      ties: intType.mapFromDatabaseResponse(data['${effectivePrefix}ties']),
      totalRunsScored: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_runs_scored']),
      totalRunsAllowed: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}total_runs_allowed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || firestoreID != null) {
      map['firestore_i_d'] = Variable<String>(firestoreID);
    }
    if (!nullToAbsent || statkeeperFirestoreID != null) {
      map['statkeeper_firestore_i_d'] = Variable<String>(statkeeperFirestoreID);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || wins != null) {
      map['wins'] = Variable<int>(wins);
    }
    if (!nullToAbsent || losses != null) {
      map['losses'] = Variable<int>(losses);
    }
    if (!nullToAbsent || ties != null) {
      map['ties'] = Variable<int>(ties);
    }
    if (!nullToAbsent || totalRunsScored != null) {
      map['total_runs_scored'] = Variable<int>(totalRunsScored);
    }
    if (!nullToAbsent || totalRunsAllowed != null) {
      map['total_runs_allowed'] = Variable<int>(totalRunsAllowed);
    }
    return map;
  }

  TeamsCompanion toCompanion(bool nullToAbsent) {
    return TeamsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      firestoreID: firestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreID),
      statkeeperFirestoreID: statkeeperFirestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(statkeeperFirestoreID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      wins: wins == null && nullToAbsent ? const Value.absent() : Value(wins),
      losses:
          losses == null && nullToAbsent ? const Value.absent() : Value(losses),
      ties: ties == null && nullToAbsent ? const Value.absent() : Value(ties),
      totalRunsScored: totalRunsScored == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRunsScored),
      totalRunsAllowed: totalRunsAllowed == null && nullToAbsent
          ? const Value.absent()
          : Value(totalRunsAllowed),
    );
  }

  factory Team.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Team(
      id: serializer.fromJson<int>(json['id']),
      firestoreID: serializer.fromJson<String>(json['firestoreID']),
      statkeeperFirestoreID:
          serializer.fromJson<String>(json['statkeeperFirestoreID']),
      name: serializer.fromJson<String>(json['name']),
      wins: serializer.fromJson<int>(json['wins']),
      losses: serializer.fromJson<int>(json['losses']),
      ties: serializer.fromJson<int>(json['ties']),
      totalRunsScored: serializer.fromJson<int>(json['totalRunsScored']),
      totalRunsAllowed: serializer.fromJson<int>(json['totalRunsAllowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firestoreID': serializer.toJson<String>(firestoreID),
      'statkeeperFirestoreID': serializer.toJson<String>(statkeeperFirestoreID),
      'name': serializer.toJson<String>(name),
      'wins': serializer.toJson<int>(wins),
      'losses': serializer.toJson<int>(losses),
      'ties': serializer.toJson<int>(ties),
      'totalRunsScored': serializer.toJson<int>(totalRunsScored),
      'totalRunsAllowed': serializer.toJson<int>(totalRunsAllowed),
    };
  }

  Team copyWith(
          {int id,
          String firestoreID,
          String statkeeperFirestoreID,
          String name,
          int wins,
          int losses,
          int ties,
          int totalRunsScored,
          int totalRunsAllowed}) =>
      Team(
        id: id ?? this.id,
        firestoreID: firestoreID ?? this.firestoreID,
        statkeeperFirestoreID:
            statkeeperFirestoreID ?? this.statkeeperFirestoreID,
        name: name ?? this.name,
        wins: wins ?? this.wins,
        losses: losses ?? this.losses,
        ties: ties ?? this.ties,
        totalRunsScored: totalRunsScored ?? this.totalRunsScored,
        totalRunsAllowed: totalRunsAllowed ?? this.totalRunsAllowed,
      );
  @override
  String toString() {
    return (StringBuffer('Team(')
          ..write('id: $id, ')
          ..write('firestoreID: $firestoreID, ')
          ..write('statkeeperFirestoreID: $statkeeperFirestoreID, ')
          ..write('name: $name, ')
          ..write('wins: $wins, ')
          ..write('losses: $losses, ')
          ..write('ties: $ties, ')
          ..write('totalRunsScored: $totalRunsScored, ')
          ..write('totalRunsAllowed: $totalRunsAllowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          firestoreID.hashCode,
          $mrjc(
              statkeeperFirestoreID.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      wins.hashCode,
                      $mrjc(
                          losses.hashCode,
                          $mrjc(
                              ties.hashCode,
                              $mrjc(totalRunsScored.hashCode,
                                  totalRunsAllowed.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Team &&
          other.id == this.id &&
          other.firestoreID == this.firestoreID &&
          other.statkeeperFirestoreID == this.statkeeperFirestoreID &&
          other.name == this.name &&
          other.wins == this.wins &&
          other.losses == this.losses &&
          other.ties == this.ties &&
          other.totalRunsScored == this.totalRunsScored &&
          other.totalRunsAllowed == this.totalRunsAllowed);
}

class TeamsCompanion extends UpdateCompanion<Team> {
  final Value<int> id;
  final Value<String> firestoreID;
  final Value<String> statkeeperFirestoreID;
  final Value<String> name;
  final Value<int> wins;
  final Value<int> losses;
  final Value<int> ties;
  final Value<int> totalRunsScored;
  final Value<int> totalRunsAllowed;
  const TeamsCompanion({
    this.id = const Value.absent(),
    this.firestoreID = const Value.absent(),
    this.statkeeperFirestoreID = const Value.absent(),
    this.name = const Value.absent(),
    this.wins = const Value.absent(),
    this.losses = const Value.absent(),
    this.ties = const Value.absent(),
    this.totalRunsScored = const Value.absent(),
    this.totalRunsAllowed = const Value.absent(),
  });
  TeamsCompanion.insert({
    this.id = const Value.absent(),
    @required String firestoreID,
    @required String statkeeperFirestoreID,
    @required String name,
    this.wins = const Value.absent(),
    this.losses = const Value.absent(),
    this.ties = const Value.absent(),
    this.totalRunsScored = const Value.absent(),
    this.totalRunsAllowed = const Value.absent(),
  })  : firestoreID = Value(firestoreID),
        statkeeperFirestoreID = Value(statkeeperFirestoreID),
        name = Value(name);
  static Insertable<Team> custom({
    Expression<int> id,
    Expression<String> firestoreID,
    Expression<String> statkeeperFirestoreID,
    Expression<String> name,
    Expression<int> wins,
    Expression<int> losses,
    Expression<int> ties,
    Expression<int> totalRunsScored,
    Expression<int> totalRunsAllowed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firestoreID != null) 'firestore_i_d': firestoreID,
      if (statkeeperFirestoreID != null)
        'statkeeper_firestore_i_d': statkeeperFirestoreID,
      if (name != null) 'name': name,
      if (wins != null) 'wins': wins,
      if (losses != null) 'losses': losses,
      if (ties != null) 'ties': ties,
      if (totalRunsScored != null) 'total_runs_scored': totalRunsScored,
      if (totalRunsAllowed != null) 'total_runs_allowed': totalRunsAllowed,
    });
  }

  TeamsCompanion copyWith(
      {Value<int> id,
      Value<String> firestoreID,
      Value<String> statkeeperFirestoreID,
      Value<String> name,
      Value<int> wins,
      Value<int> losses,
      Value<int> ties,
      Value<int> totalRunsScored,
      Value<int> totalRunsAllowed}) {
    return TeamsCompanion(
      id: id ?? this.id,
      firestoreID: firestoreID ?? this.firestoreID,
      statkeeperFirestoreID:
          statkeeperFirestoreID ?? this.statkeeperFirestoreID,
      name: name ?? this.name,
      wins: wins ?? this.wins,
      losses: losses ?? this.losses,
      ties: ties ?? this.ties,
      totalRunsScored: totalRunsScored ?? this.totalRunsScored,
      totalRunsAllowed: totalRunsAllowed ?? this.totalRunsAllowed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firestoreID.present) {
      map['firestore_i_d'] = Variable<String>(firestoreID.value);
    }
    if (statkeeperFirestoreID.present) {
      map['statkeeper_firestore_i_d'] =
          Variable<String>(statkeeperFirestoreID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (wins.present) {
      map['wins'] = Variable<int>(wins.value);
    }
    if (losses.present) {
      map['losses'] = Variable<int>(losses.value);
    }
    if (ties.present) {
      map['ties'] = Variable<int>(ties.value);
    }
    if (totalRunsScored.present) {
      map['total_runs_scored'] = Variable<int>(totalRunsScored.value);
    }
    if (totalRunsAllowed.present) {
      map['total_runs_allowed'] = Variable<int>(totalRunsAllowed.value);
    }
    return map;
  }
}

class $TeamsTable extends Teams with TableInfo<$TeamsTable, Team> {
  final GeneratedDatabase _db;
  final String _alias;
  $TeamsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _firestoreIDMeta =
      const VerificationMeta('firestoreID');
  GeneratedTextColumn _firestoreID;
  @override
  GeneratedTextColumn get firestoreID =>
      _firestoreID ??= _constructFirestoreID();
  GeneratedTextColumn _constructFirestoreID() {
    return GeneratedTextColumn(
      'firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statkeeperFirestoreIDMeta =
      const VerificationMeta('statkeeperFirestoreID');
  GeneratedTextColumn _statkeeperFirestoreID;
  @override
  GeneratedTextColumn get statkeeperFirestoreID =>
      _statkeeperFirestoreID ??= _constructStatkeeperFirestoreID();
  GeneratedTextColumn _constructStatkeeperFirestoreID() {
    return GeneratedTextColumn(
      'statkeeper_firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _winsMeta = const VerificationMeta('wins');
  GeneratedIntColumn _wins;
  @override
  GeneratedIntColumn get wins => _wins ??= _constructWins();
  GeneratedIntColumn _constructWins() {
    return GeneratedIntColumn('wins', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _lossesMeta = const VerificationMeta('losses');
  GeneratedIntColumn _losses;
  @override
  GeneratedIntColumn get losses => _losses ??= _constructLosses();
  GeneratedIntColumn _constructLosses() {
    return GeneratedIntColumn('losses', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _tiesMeta = const VerificationMeta('ties');
  GeneratedIntColumn _ties;
  @override
  GeneratedIntColumn get ties => _ties ??= _constructTies();
  GeneratedIntColumn _constructTies() {
    return GeneratedIntColumn('ties', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _totalRunsScoredMeta =
      const VerificationMeta('totalRunsScored');
  GeneratedIntColumn _totalRunsScored;
  @override
  GeneratedIntColumn get totalRunsScored =>
      _totalRunsScored ??= _constructTotalRunsScored();
  GeneratedIntColumn _constructTotalRunsScored() {
    return GeneratedIntColumn('total_runs_scored', $tableName, true,
        defaultValue: zero);
  }

  final VerificationMeta _totalRunsAllowedMeta =
      const VerificationMeta('totalRunsAllowed');
  GeneratedIntColumn _totalRunsAllowed;
  @override
  GeneratedIntColumn get totalRunsAllowed =>
      _totalRunsAllowed ??= _constructTotalRunsAllowed();
  GeneratedIntColumn _constructTotalRunsAllowed() {
    return GeneratedIntColumn('total_runs_allowed', $tableName, true,
        defaultValue: zero);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        firestoreID,
        statkeeperFirestoreID,
        name,
        wins,
        losses,
        ties,
        totalRunsScored,
        totalRunsAllowed
      ];
  @override
  $TeamsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'teams';
  @override
  final String actualTableName = 'teams';
  @override
  VerificationContext validateIntegrity(Insertable<Team> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('firestore_i_d')) {
      context.handle(
          _firestoreIDMeta,
          firestoreID.isAcceptableOrUnknown(
              data['firestore_i_d'], _firestoreIDMeta));
    } else if (isInserting) {
      context.missing(_firestoreIDMeta);
    }
    if (data.containsKey('statkeeper_firestore_i_d')) {
      context.handle(
          _statkeeperFirestoreIDMeta,
          statkeeperFirestoreID.isAcceptableOrUnknown(
              data['statkeeper_firestore_i_d'], _statkeeperFirestoreIDMeta));
    } else if (isInserting) {
      context.missing(_statkeeperFirestoreIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('wins')) {
      context.handle(
          _winsMeta, wins.isAcceptableOrUnknown(data['wins'], _winsMeta));
    }
    if (data.containsKey('losses')) {
      context.handle(_lossesMeta,
          losses.isAcceptableOrUnknown(data['losses'], _lossesMeta));
    }
    if (data.containsKey('ties')) {
      context.handle(
          _tiesMeta, ties.isAcceptableOrUnknown(data['ties'], _tiesMeta));
    }
    if (data.containsKey('total_runs_scored')) {
      context.handle(
          _totalRunsScoredMeta,
          totalRunsScored.isAcceptableOrUnknown(
              data['total_runs_scored'], _totalRunsScoredMeta));
    }
    if (data.containsKey('total_runs_allowed')) {
      context.handle(
          _totalRunsAllowedMeta,
          totalRunsAllowed.isAcceptableOrUnknown(
              data['total_runs_allowed'], _totalRunsAllowedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Team map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Team.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TeamsTable createAlias(String alias) {
    return $TeamsTable(_db, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final String firestoreID;
  final String teamfirestoreid;
  final String statkeeperFirestoreID;
  final String name;
  final String team;
  final int gender;
  final int games;
  final int runs;
  final int rbis;
  final int singles;
  final int doubles;
  final int triples;
  final int hrs;
  final int walks;
  final int outs;
  final int sacFlies;
  final int reachedOnErrors;
  final int strikeouts;
  final int stolenBases;
  final int hbp;
  final int battingOrder;
  Player(
      {this.id,
      @required this.firestoreID,
      @required this.teamfirestoreid,
      @required this.statkeeperFirestoreID,
      @required this.name,
      this.team,
      this.gender,
      this.games,
      this.runs,
      this.rbis,
      this.singles,
      this.doubles,
      this.triples,
      this.hrs,
      this.walks,
      this.outs,
      this.sacFlies,
      this.reachedOnErrors,
      this.strikeouts,
      this.stolenBases,
      this.hbp,
      this.battingOrder});
  factory Player.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Player(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      firestoreID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}firestore_i_d']),
      teamfirestoreid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}teamfirestoreid']),
      statkeeperFirestoreID: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}statkeeper_firestore_i_d']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      team: stringType.mapFromDatabaseResponse(data['${effectivePrefix}team']),
      gender: intType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      games: intType.mapFromDatabaseResponse(data['${effectivePrefix}games']),
      runs: intType.mapFromDatabaseResponse(data['${effectivePrefix}runs']),
      rbis: intType.mapFromDatabaseResponse(data['${effectivePrefix}rbis']),
      singles:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}singles']),
      doubles:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}doubles']),
      triples:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}triples']),
      hrs: intType.mapFromDatabaseResponse(data['${effectivePrefix}hrs']),
      walks: intType.mapFromDatabaseResponse(data['${effectivePrefix}walks']),
      outs: intType.mapFromDatabaseResponse(data['${effectivePrefix}outs']),
      sacFlies:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}sac_flies']),
      reachedOnErrors: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}reached_on_errors']),
      strikeouts:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}strikeouts']),
      stolenBases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}stolen_bases']),
      hbp: intType.mapFromDatabaseResponse(data['${effectivePrefix}hbp']),
      battingOrder: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}batting_order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || firestoreID != null) {
      map['firestore_i_d'] = Variable<String>(firestoreID);
    }
    if (!nullToAbsent || teamfirestoreid != null) {
      map['teamfirestoreid'] = Variable<String>(teamfirestoreid);
    }
    if (!nullToAbsent || statkeeperFirestoreID != null) {
      map['statkeeper_firestore_i_d'] = Variable<String>(statkeeperFirestoreID);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || team != null) {
      map['team'] = Variable<String>(team);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<int>(gender);
    }
    if (!nullToAbsent || games != null) {
      map['games'] = Variable<int>(games);
    }
    if (!nullToAbsent || runs != null) {
      map['runs'] = Variable<int>(runs);
    }
    if (!nullToAbsent || rbis != null) {
      map['rbis'] = Variable<int>(rbis);
    }
    if (!nullToAbsent || singles != null) {
      map['singles'] = Variable<int>(singles);
    }
    if (!nullToAbsent || doubles != null) {
      map['doubles'] = Variable<int>(doubles);
    }
    if (!nullToAbsent || triples != null) {
      map['triples'] = Variable<int>(triples);
    }
    if (!nullToAbsent || hrs != null) {
      map['hrs'] = Variable<int>(hrs);
    }
    if (!nullToAbsent || walks != null) {
      map['walks'] = Variable<int>(walks);
    }
    if (!nullToAbsent || outs != null) {
      map['outs'] = Variable<int>(outs);
    }
    if (!nullToAbsent || sacFlies != null) {
      map['sac_flies'] = Variable<int>(sacFlies);
    }
    if (!nullToAbsent || reachedOnErrors != null) {
      map['reached_on_errors'] = Variable<int>(reachedOnErrors);
    }
    if (!nullToAbsent || strikeouts != null) {
      map['strikeouts'] = Variable<int>(strikeouts);
    }
    if (!nullToAbsent || stolenBases != null) {
      map['stolen_bases'] = Variable<int>(stolenBases);
    }
    if (!nullToAbsent || hbp != null) {
      map['hbp'] = Variable<int>(hbp);
    }
    if (!nullToAbsent || battingOrder != null) {
      map['batting_order'] = Variable<int>(battingOrder);
    }
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      firestoreID: firestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreID),
      teamfirestoreid: teamfirestoreid == null && nullToAbsent
          ? const Value.absent()
          : Value(teamfirestoreid),
      statkeeperFirestoreID: statkeeperFirestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(statkeeperFirestoreID),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      team: team == null && nullToAbsent ? const Value.absent() : Value(team),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      games:
          games == null && nullToAbsent ? const Value.absent() : Value(games),
      runs: runs == null && nullToAbsent ? const Value.absent() : Value(runs),
      rbis: rbis == null && nullToAbsent ? const Value.absent() : Value(rbis),
      singles: singles == null && nullToAbsent
          ? const Value.absent()
          : Value(singles),
      doubles: doubles == null && nullToAbsent
          ? const Value.absent()
          : Value(doubles),
      triples: triples == null && nullToAbsent
          ? const Value.absent()
          : Value(triples),
      hrs: hrs == null && nullToAbsent ? const Value.absent() : Value(hrs),
      walks:
          walks == null && nullToAbsent ? const Value.absent() : Value(walks),
      outs: outs == null && nullToAbsent ? const Value.absent() : Value(outs),
      sacFlies: sacFlies == null && nullToAbsent
          ? const Value.absent()
          : Value(sacFlies),
      reachedOnErrors: reachedOnErrors == null && nullToAbsent
          ? const Value.absent()
          : Value(reachedOnErrors),
      strikeouts: strikeouts == null && nullToAbsent
          ? const Value.absent()
          : Value(strikeouts),
      stolenBases: stolenBases == null && nullToAbsent
          ? const Value.absent()
          : Value(stolenBases),
      hbp: hbp == null && nullToAbsent ? const Value.absent() : Value(hbp),
      battingOrder: battingOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(battingOrder),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      firestoreID: serializer.fromJson<String>(json['firestoreID']),
      teamfirestoreid: serializer.fromJson<String>(json['teamfirestoreid']),
      statkeeperFirestoreID:
          serializer.fromJson<String>(json['statkeeperFirestoreID']),
      name: serializer.fromJson<String>(json['name']),
      team: serializer.fromJson<String>(json['team']),
      gender: serializer.fromJson<int>(json['gender']),
      games: serializer.fromJson<int>(json['games']),
      runs: serializer.fromJson<int>(json['runs']),
      rbis: serializer.fromJson<int>(json['rbis']),
      singles: serializer.fromJson<int>(json['singles']),
      doubles: serializer.fromJson<int>(json['doubles']),
      triples: serializer.fromJson<int>(json['triples']),
      hrs: serializer.fromJson<int>(json['hrs']),
      walks: serializer.fromJson<int>(json['walks']),
      outs: serializer.fromJson<int>(json['outs']),
      sacFlies: serializer.fromJson<int>(json['sacFlies']),
      reachedOnErrors: serializer.fromJson<int>(json['reachedOnErrors']),
      strikeouts: serializer.fromJson<int>(json['strikeouts']),
      stolenBases: serializer.fromJson<int>(json['stolenBases']),
      hbp: serializer.fromJson<int>(json['hbp']),
      battingOrder: serializer.fromJson<int>(json['battingOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firestoreID': serializer.toJson<String>(firestoreID),
      'teamfirestoreid': serializer.toJson<String>(teamfirestoreid),
      'statkeeperFirestoreID': serializer.toJson<String>(statkeeperFirestoreID),
      'name': serializer.toJson<String>(name),
      'team': serializer.toJson<String>(team),
      'gender': serializer.toJson<int>(gender),
      'games': serializer.toJson<int>(games),
      'runs': serializer.toJson<int>(runs),
      'rbis': serializer.toJson<int>(rbis),
      'singles': serializer.toJson<int>(singles),
      'doubles': serializer.toJson<int>(doubles),
      'triples': serializer.toJson<int>(triples),
      'hrs': serializer.toJson<int>(hrs),
      'walks': serializer.toJson<int>(walks),
      'outs': serializer.toJson<int>(outs),
      'sacFlies': serializer.toJson<int>(sacFlies),
      'reachedOnErrors': serializer.toJson<int>(reachedOnErrors),
      'strikeouts': serializer.toJson<int>(strikeouts),
      'stolenBases': serializer.toJson<int>(stolenBases),
      'hbp': serializer.toJson<int>(hbp),
      'battingOrder': serializer.toJson<int>(battingOrder),
    };
  }

  Player copyWith(
          {int id,
          String firestoreID,
          String teamfirestoreid,
          String statkeeperFirestoreID,
          String name,
          String team,
          int gender,
          int games,
          int runs,
          int rbis,
          int singles,
          int doubles,
          int triples,
          int hrs,
          int walks,
          int outs,
          int sacFlies,
          int reachedOnErrors,
          int strikeouts,
          int stolenBases,
          int hbp,
          int battingOrder}) =>
      Player(
        id: id ?? this.id,
        firestoreID: firestoreID ?? this.firestoreID,
        teamfirestoreid: teamfirestoreid ?? this.teamfirestoreid,
        statkeeperFirestoreID:
            statkeeperFirestoreID ?? this.statkeeperFirestoreID,
        name: name ?? this.name,
        team: team ?? this.team,
        gender: gender ?? this.gender,
        games: games ?? this.games,
        runs: runs ?? this.runs,
        rbis: rbis ?? this.rbis,
        singles: singles ?? this.singles,
        doubles: doubles ?? this.doubles,
        triples: triples ?? this.triples,
        hrs: hrs ?? this.hrs,
        walks: walks ?? this.walks,
        outs: outs ?? this.outs,
        sacFlies: sacFlies ?? this.sacFlies,
        reachedOnErrors: reachedOnErrors ?? this.reachedOnErrors,
        strikeouts: strikeouts ?? this.strikeouts,
        stolenBases: stolenBases ?? this.stolenBases,
        hbp: hbp ?? this.hbp,
        battingOrder: battingOrder ?? this.battingOrder,
      );
  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('firestoreID: $firestoreID, ')
          ..write('teamfirestoreid: $teamfirestoreid, ')
          ..write('statkeeperFirestoreID: $statkeeperFirestoreID, ')
          ..write('name: $name, ')
          ..write('team: $team, ')
          ..write('gender: $gender, ')
          ..write('games: $games, ')
          ..write('runs: $runs, ')
          ..write('rbis: $rbis, ')
          ..write('singles: $singles, ')
          ..write('doubles: $doubles, ')
          ..write('triples: $triples, ')
          ..write('hrs: $hrs, ')
          ..write('walks: $walks, ')
          ..write('outs: $outs, ')
          ..write('sacFlies: $sacFlies, ')
          ..write('reachedOnErrors: $reachedOnErrors, ')
          ..write('strikeouts: $strikeouts, ')
          ..write('stolenBases: $stolenBases, ')
          ..write('hbp: $hbp, ')
          ..write('battingOrder: $battingOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          firestoreID.hashCode,
          $mrjc(
              teamfirestoreid.hashCode,
              $mrjc(
                  statkeeperFirestoreID.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(
                          team.hashCode,
                          $mrjc(
                              gender.hashCode,
                              $mrjc(
                                  games.hashCode,
                                  $mrjc(
                                      runs.hashCode,
                                      $mrjc(
                                          rbis.hashCode,
                                          $mrjc(
                                              singles.hashCode,
                                              $mrjc(
                                                  doubles.hashCode,
                                                  $mrjc(
                                                      triples.hashCode,
                                                      $mrjc(
                                                          hrs.hashCode,
                                                          $mrjc(
                                                              walks.hashCode,
                                                              $mrjc(
                                                                  outs.hashCode,
                                                                  $mrjc(
                                                                      sacFlies
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          reachedOnErrors
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              strikeouts.hashCode,
                                                                              $mrjc(stolenBases.hashCode, $mrjc(hbp.hashCode, battingOrder.hashCode))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.firestoreID == this.firestoreID &&
          other.teamfirestoreid == this.teamfirestoreid &&
          other.statkeeperFirestoreID == this.statkeeperFirestoreID &&
          other.name == this.name &&
          other.team == this.team &&
          other.gender == this.gender &&
          other.games == this.games &&
          other.runs == this.runs &&
          other.rbis == this.rbis &&
          other.singles == this.singles &&
          other.doubles == this.doubles &&
          other.triples == this.triples &&
          other.hrs == this.hrs &&
          other.walks == this.walks &&
          other.outs == this.outs &&
          other.sacFlies == this.sacFlies &&
          other.reachedOnErrors == this.reachedOnErrors &&
          other.strikeouts == this.strikeouts &&
          other.stolenBases == this.stolenBases &&
          other.hbp == this.hbp &&
          other.battingOrder == this.battingOrder);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> firestoreID;
  final Value<String> teamfirestoreid;
  final Value<String> statkeeperFirestoreID;
  final Value<String> name;
  final Value<String> team;
  final Value<int> gender;
  final Value<int> games;
  final Value<int> runs;
  final Value<int> rbis;
  final Value<int> singles;
  final Value<int> doubles;
  final Value<int> triples;
  final Value<int> hrs;
  final Value<int> walks;
  final Value<int> outs;
  final Value<int> sacFlies;
  final Value<int> reachedOnErrors;
  final Value<int> strikeouts;
  final Value<int> stolenBases;
  final Value<int> hbp;
  final Value<int> battingOrder;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.firestoreID = const Value.absent(),
    this.teamfirestoreid = const Value.absent(),
    this.statkeeperFirestoreID = const Value.absent(),
    this.name = const Value.absent(),
    this.team = const Value.absent(),
    this.gender = const Value.absent(),
    this.games = const Value.absent(),
    this.runs = const Value.absent(),
    this.rbis = const Value.absent(),
    this.singles = const Value.absent(),
    this.doubles = const Value.absent(),
    this.triples = const Value.absent(),
    this.hrs = const Value.absent(),
    this.walks = const Value.absent(),
    this.outs = const Value.absent(),
    this.sacFlies = const Value.absent(),
    this.reachedOnErrors = const Value.absent(),
    this.strikeouts = const Value.absent(),
    this.stolenBases = const Value.absent(),
    this.hbp = const Value.absent(),
    this.battingOrder = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    @required String firestoreID,
    @required String teamfirestoreid,
    @required String statkeeperFirestoreID,
    @required String name,
    this.team = const Value.absent(),
    this.gender = const Value.absent(),
    this.games = const Value.absent(),
    this.runs = const Value.absent(),
    this.rbis = const Value.absent(),
    this.singles = const Value.absent(),
    this.doubles = const Value.absent(),
    this.triples = const Value.absent(),
    this.hrs = const Value.absent(),
    this.walks = const Value.absent(),
    this.outs = const Value.absent(),
    this.sacFlies = const Value.absent(),
    this.reachedOnErrors = const Value.absent(),
    this.strikeouts = const Value.absent(),
    this.stolenBases = const Value.absent(),
    this.hbp = const Value.absent(),
    this.battingOrder = const Value.absent(),
  })  : firestoreID = Value(firestoreID),
        teamfirestoreid = Value(teamfirestoreid),
        statkeeperFirestoreID = Value(statkeeperFirestoreID),
        name = Value(name);
  static Insertable<Player> custom({
    Expression<int> id,
    Expression<String> firestoreID,
    Expression<String> teamfirestoreid,
    Expression<String> statkeeperFirestoreID,
    Expression<String> name,
    Expression<String> team,
    Expression<int> gender,
    Expression<int> games,
    Expression<int> runs,
    Expression<int> rbis,
    Expression<int> singles,
    Expression<int> doubles,
    Expression<int> triples,
    Expression<int> hrs,
    Expression<int> walks,
    Expression<int> outs,
    Expression<int> sacFlies,
    Expression<int> reachedOnErrors,
    Expression<int> strikeouts,
    Expression<int> stolenBases,
    Expression<int> hbp,
    Expression<int> battingOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firestoreID != null) 'firestore_i_d': firestoreID,
      if (teamfirestoreid != null) 'teamfirestoreid': teamfirestoreid,
      if (statkeeperFirestoreID != null)
        'statkeeper_firestore_i_d': statkeeperFirestoreID,
      if (name != null) 'name': name,
      if (team != null) 'team': team,
      if (gender != null) 'gender': gender,
      if (games != null) 'games': games,
      if (runs != null) 'runs': runs,
      if (rbis != null) 'rbis': rbis,
      if (singles != null) 'singles': singles,
      if (doubles != null) 'doubles': doubles,
      if (triples != null) 'triples': triples,
      if (hrs != null) 'hrs': hrs,
      if (walks != null) 'walks': walks,
      if (outs != null) 'outs': outs,
      if (sacFlies != null) 'sac_flies': sacFlies,
      if (reachedOnErrors != null) 'reached_on_errors': reachedOnErrors,
      if (strikeouts != null) 'strikeouts': strikeouts,
      if (stolenBases != null) 'stolen_bases': stolenBases,
      if (hbp != null) 'hbp': hbp,
      if (battingOrder != null) 'batting_order': battingOrder,
    });
  }

  PlayersCompanion copyWith(
      {Value<int> id,
      Value<String> firestoreID,
      Value<String> teamfirestoreid,
      Value<String> statkeeperFirestoreID,
      Value<String> name,
      Value<String> team,
      Value<int> gender,
      Value<int> games,
      Value<int> runs,
      Value<int> rbis,
      Value<int> singles,
      Value<int> doubles,
      Value<int> triples,
      Value<int> hrs,
      Value<int> walks,
      Value<int> outs,
      Value<int> sacFlies,
      Value<int> reachedOnErrors,
      Value<int> strikeouts,
      Value<int> stolenBases,
      Value<int> hbp,
      Value<int> battingOrder}) {
    return PlayersCompanion(
      id: id ?? this.id,
      firestoreID: firestoreID ?? this.firestoreID,
      teamfirestoreid: teamfirestoreid ?? this.teamfirestoreid,
      statkeeperFirestoreID:
          statkeeperFirestoreID ?? this.statkeeperFirestoreID,
      name: name ?? this.name,
      team: team ?? this.team,
      gender: gender ?? this.gender,
      games: games ?? this.games,
      runs: runs ?? this.runs,
      rbis: rbis ?? this.rbis,
      singles: singles ?? this.singles,
      doubles: doubles ?? this.doubles,
      triples: triples ?? this.triples,
      hrs: hrs ?? this.hrs,
      walks: walks ?? this.walks,
      outs: outs ?? this.outs,
      sacFlies: sacFlies ?? this.sacFlies,
      reachedOnErrors: reachedOnErrors ?? this.reachedOnErrors,
      strikeouts: strikeouts ?? this.strikeouts,
      stolenBases: stolenBases ?? this.stolenBases,
      hbp: hbp ?? this.hbp,
      battingOrder: battingOrder ?? this.battingOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firestoreID.present) {
      map['firestore_i_d'] = Variable<String>(firestoreID.value);
    }
    if (teamfirestoreid.present) {
      map['teamfirestoreid'] = Variable<String>(teamfirestoreid.value);
    }
    if (statkeeperFirestoreID.present) {
      map['statkeeper_firestore_i_d'] =
          Variable<String>(statkeeperFirestoreID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (team.present) {
      map['team'] = Variable<String>(team.value);
    }
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (games.present) {
      map['games'] = Variable<int>(games.value);
    }
    if (runs.present) {
      map['runs'] = Variable<int>(runs.value);
    }
    if (rbis.present) {
      map['rbis'] = Variable<int>(rbis.value);
    }
    if (singles.present) {
      map['singles'] = Variable<int>(singles.value);
    }
    if (doubles.present) {
      map['doubles'] = Variable<int>(doubles.value);
    }
    if (triples.present) {
      map['triples'] = Variable<int>(triples.value);
    }
    if (hrs.present) {
      map['hrs'] = Variable<int>(hrs.value);
    }
    if (walks.present) {
      map['walks'] = Variable<int>(walks.value);
    }
    if (outs.present) {
      map['outs'] = Variable<int>(outs.value);
    }
    if (sacFlies.present) {
      map['sac_flies'] = Variable<int>(sacFlies.value);
    }
    if (reachedOnErrors.present) {
      map['reached_on_errors'] = Variable<int>(reachedOnErrors.value);
    }
    if (strikeouts.present) {
      map['strikeouts'] = Variable<int>(strikeouts.value);
    }
    if (stolenBases.present) {
      map['stolen_bases'] = Variable<int>(stolenBases.value);
    }
    if (hbp.present) {
      map['hbp'] = Variable<int>(hbp.value);
    }
    if (battingOrder.present) {
      map['batting_order'] = Variable<int>(battingOrder.value);
    }
    return map;
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  final GeneratedDatabase _db;
  final String _alias;
  $PlayersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _firestoreIDMeta =
      const VerificationMeta('firestoreID');
  GeneratedTextColumn _firestoreID;
  @override
  GeneratedTextColumn get firestoreID =>
      _firestoreID ??= _constructFirestoreID();
  GeneratedTextColumn _constructFirestoreID() {
    return GeneratedTextColumn(
      'firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _teamfirestoreidMeta =
      const VerificationMeta('teamfirestoreid');
  GeneratedTextColumn _teamfirestoreid;
  @override
  GeneratedTextColumn get teamfirestoreid =>
      _teamfirestoreid ??= _constructTeamfirestoreid();
  GeneratedTextColumn _constructTeamfirestoreid() {
    return GeneratedTextColumn(
      'teamfirestoreid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statkeeperFirestoreIDMeta =
      const VerificationMeta('statkeeperFirestoreID');
  GeneratedTextColumn _statkeeperFirestoreID;
  @override
  GeneratedTextColumn get statkeeperFirestoreID =>
      _statkeeperFirestoreID ??= _constructStatkeeperFirestoreID();
  GeneratedTextColumn _constructStatkeeperFirestoreID() {
    return GeneratedTextColumn(
      'statkeeper_firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _teamMeta = const VerificationMeta('team');
  GeneratedTextColumn _team;
  @override
  GeneratedTextColumn get team => _team ??= _constructTeam();
  GeneratedTextColumn _constructTeam() {
    return GeneratedTextColumn('team', $tableName, true,
        defaultValue: const Constant("Free Agent"));
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedIntColumn _gender;
  @override
  GeneratedIntColumn get gender => _gender ??= _constructGender();
  GeneratedIntColumn _constructGender() {
    return GeneratedIntColumn('gender', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _gamesMeta = const VerificationMeta('games');
  GeneratedIntColumn _games;
  @override
  GeneratedIntColumn get games => _games ??= _constructGames();
  GeneratedIntColumn _constructGames() {
    return GeneratedIntColumn('games', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _runsMeta = const VerificationMeta('runs');
  GeneratedIntColumn _runs;
  @override
  GeneratedIntColumn get runs => _runs ??= _constructRuns();
  GeneratedIntColumn _constructRuns() {
    return GeneratedIntColumn('runs', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _rbisMeta = const VerificationMeta('rbis');
  GeneratedIntColumn _rbis;
  @override
  GeneratedIntColumn get rbis => _rbis ??= _constructRbis();
  GeneratedIntColumn _constructRbis() {
    return GeneratedIntColumn('rbis', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _singlesMeta = const VerificationMeta('singles');
  GeneratedIntColumn _singles;
  @override
  GeneratedIntColumn get singles => _singles ??= _constructSingles();
  GeneratedIntColumn _constructSingles() {
    return GeneratedIntColumn('singles', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _doublesMeta = const VerificationMeta('doubles');
  GeneratedIntColumn _doubles;
  @override
  GeneratedIntColumn get doubles => _doubles ??= _constructDoubles();
  GeneratedIntColumn _constructDoubles() {
    return GeneratedIntColumn('doubles', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _triplesMeta = const VerificationMeta('triples');
  GeneratedIntColumn _triples;
  @override
  GeneratedIntColumn get triples => _triples ??= _constructTriples();
  GeneratedIntColumn _constructTriples() {
    return GeneratedIntColumn('triples', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _hrsMeta = const VerificationMeta('hrs');
  GeneratedIntColumn _hrs;
  @override
  GeneratedIntColumn get hrs => _hrs ??= _constructHrs();
  GeneratedIntColumn _constructHrs() {
    return GeneratedIntColumn('hrs', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _walksMeta = const VerificationMeta('walks');
  GeneratedIntColumn _walks;
  @override
  GeneratedIntColumn get walks => _walks ??= _constructWalks();
  GeneratedIntColumn _constructWalks() {
    return GeneratedIntColumn('walks', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _outsMeta = const VerificationMeta('outs');
  GeneratedIntColumn _outs;
  @override
  GeneratedIntColumn get outs => _outs ??= _constructOuts();
  GeneratedIntColumn _constructOuts() {
    return GeneratedIntColumn('outs', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _sacFliesMeta = const VerificationMeta('sacFlies');
  GeneratedIntColumn _sacFlies;
  @override
  GeneratedIntColumn get sacFlies => _sacFlies ??= _constructSacFlies();
  GeneratedIntColumn _constructSacFlies() {
    return GeneratedIntColumn('sac_flies', $tableName, true,
        defaultValue: zero);
  }

  final VerificationMeta _reachedOnErrorsMeta =
      const VerificationMeta('reachedOnErrors');
  GeneratedIntColumn _reachedOnErrors;
  @override
  GeneratedIntColumn get reachedOnErrors =>
      _reachedOnErrors ??= _constructReachedOnErrors();
  GeneratedIntColumn _constructReachedOnErrors() {
    return GeneratedIntColumn('reached_on_errors', $tableName, true,
        defaultValue: zero);
  }

  final VerificationMeta _strikeoutsMeta = const VerificationMeta('strikeouts');
  GeneratedIntColumn _strikeouts;
  @override
  GeneratedIntColumn get strikeouts => _strikeouts ??= _constructStrikeouts();
  GeneratedIntColumn _constructStrikeouts() {
    return GeneratedIntColumn('strikeouts', $tableName, true,
        defaultValue: zero);
  }

  final VerificationMeta _stolenBasesMeta =
      const VerificationMeta('stolenBases');
  GeneratedIntColumn _stolenBases;
  @override
  GeneratedIntColumn get stolenBases =>
      _stolenBases ??= _constructStolenBases();
  GeneratedIntColumn _constructStolenBases() {
    return GeneratedIntColumn('stolen_bases', $tableName, true,
        defaultValue: zero);
  }

  final VerificationMeta _hbpMeta = const VerificationMeta('hbp');
  GeneratedIntColumn _hbp;
  @override
  GeneratedIntColumn get hbp => _hbp ??= _constructHbp();
  GeneratedIntColumn _constructHbp() {
    return GeneratedIntColumn('hbp', $tableName, true, defaultValue: zero);
  }

  final VerificationMeta _battingOrderMeta =
      const VerificationMeta('battingOrder');
  GeneratedIntColumn _battingOrder;
  @override
  GeneratedIntColumn get battingOrder =>
      _battingOrder ??= _constructBattingOrder();
  GeneratedIntColumn _constructBattingOrder() {
    return GeneratedIntColumn('batting_order', $tableName, true,
        defaultValue: const Constant(99));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        firestoreID,
        teamfirestoreid,
        statkeeperFirestoreID,
        name,
        team,
        gender,
        games,
        runs,
        rbis,
        singles,
        doubles,
        triples,
        hrs,
        walks,
        outs,
        sacFlies,
        reachedOnErrors,
        strikeouts,
        stolenBases,
        hbp,
        battingOrder
      ];
  @override
  $PlayersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'players';
  @override
  final String actualTableName = 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('firestore_i_d')) {
      context.handle(
          _firestoreIDMeta,
          firestoreID.isAcceptableOrUnknown(
              data['firestore_i_d'], _firestoreIDMeta));
    } else if (isInserting) {
      context.missing(_firestoreIDMeta);
    }
    if (data.containsKey('teamfirestoreid')) {
      context.handle(
          _teamfirestoreidMeta,
          teamfirestoreid.isAcceptableOrUnknown(
              data['teamfirestoreid'], _teamfirestoreidMeta));
    } else if (isInserting) {
      context.missing(_teamfirestoreidMeta);
    }
    if (data.containsKey('statkeeper_firestore_i_d')) {
      context.handle(
          _statkeeperFirestoreIDMeta,
          statkeeperFirestoreID.isAcceptableOrUnknown(
              data['statkeeper_firestore_i_d'], _statkeeperFirestoreIDMeta));
    } else if (isInserting) {
      context.missing(_statkeeperFirestoreIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team'], _teamMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    }
    if (data.containsKey('games')) {
      context.handle(
          _gamesMeta, games.isAcceptableOrUnknown(data['games'], _gamesMeta));
    }
    if (data.containsKey('runs')) {
      context.handle(
          _runsMeta, runs.isAcceptableOrUnknown(data['runs'], _runsMeta));
    }
    if (data.containsKey('rbis')) {
      context.handle(
          _rbisMeta, rbis.isAcceptableOrUnknown(data['rbis'], _rbisMeta));
    }
    if (data.containsKey('singles')) {
      context.handle(_singlesMeta,
          singles.isAcceptableOrUnknown(data['singles'], _singlesMeta));
    }
    if (data.containsKey('doubles')) {
      context.handle(_doublesMeta,
          doubles.isAcceptableOrUnknown(data['doubles'], _doublesMeta));
    }
    if (data.containsKey('triples')) {
      context.handle(_triplesMeta,
          triples.isAcceptableOrUnknown(data['triples'], _triplesMeta));
    }
    if (data.containsKey('hrs')) {
      context.handle(
          _hrsMeta, hrs.isAcceptableOrUnknown(data['hrs'], _hrsMeta));
    }
    if (data.containsKey('walks')) {
      context.handle(
          _walksMeta, walks.isAcceptableOrUnknown(data['walks'], _walksMeta));
    }
    if (data.containsKey('outs')) {
      context.handle(
          _outsMeta, outs.isAcceptableOrUnknown(data['outs'], _outsMeta));
    }
    if (data.containsKey('sac_flies')) {
      context.handle(_sacFliesMeta,
          sacFlies.isAcceptableOrUnknown(data['sac_flies'], _sacFliesMeta));
    }
    if (data.containsKey('reached_on_errors')) {
      context.handle(
          _reachedOnErrorsMeta,
          reachedOnErrors.isAcceptableOrUnknown(
              data['reached_on_errors'], _reachedOnErrorsMeta));
    }
    if (data.containsKey('strikeouts')) {
      context.handle(
          _strikeoutsMeta,
          strikeouts.isAcceptableOrUnknown(
              data['strikeouts'], _strikeoutsMeta));
    }
    if (data.containsKey('stolen_bases')) {
      context.handle(
          _stolenBasesMeta,
          stolenBases.isAcceptableOrUnknown(
              data['stolen_bases'], _stolenBasesMeta));
    }
    if (data.containsKey('hbp')) {
      context.handle(
          _hbpMeta, hbp.isAcceptableOrUnknown(data['hbp'], _hbpMeta));
    }
    if (data.containsKey('batting_order')) {
      context.handle(
          _battingOrderMeta,
          battingOrder.isAcceptableOrUnknown(
              data['batting_order'], _battingOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Player.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(_db, alias);
  }
}

class Play extends DataClass implements Insertable<Play> {
  final int id;
  final String statkeeperFirestoreID;
  final int number;
  final String play;
  final String batter;
  final String ondeck;
  final int team;
  final String base_1;
  final String base_2;
  final String base_3;
  final int outs;
  final int awayteam_runs;
  final int hometeam_runs;
  final String run1;
  final String run2;
  final String run3;
  final String run4;
  final int inn_changed;
  final int total_inns;
  final int inn_runs;
  Play(
      {this.id,
      @required this.statkeeperFirestoreID,
      @required this.number,
      @required this.play,
      @required this.batter,
      @required this.ondeck,
      @required this.team,
      @required this.base_1,
      @required this.base_2,
      @required this.base_3,
      @required this.outs,
      @required this.awayteam_runs,
      @required this.hometeam_runs,
      @required this.run1,
      @required this.run2,
      @required this.run3,
      @required this.run4,
      @required this.inn_changed,
      @required this.total_inns,
      @required this.inn_runs});
  factory Play.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Play(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      statkeeperFirestoreID: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}statkeeper_firestore_i_d']),
      number: intType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      play: stringType.mapFromDatabaseResponse(data['${effectivePrefix}play']),
      batter:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}batter']),
      ondeck:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}ondeck']),
      team: intType.mapFromDatabaseResponse(data['${effectivePrefix}team']),
      base_1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}base_1']),
      base_2:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}base_2']),
      base_3:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}base_3']),
      outs: intType.mapFromDatabaseResponse(data['${effectivePrefix}outs']),
      awayteam_runs: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}awayteam_runs']),
      hometeam_runs: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}hometeam_runs']),
      run1: stringType.mapFromDatabaseResponse(data['${effectivePrefix}run1']),
      run2: stringType.mapFromDatabaseResponse(data['${effectivePrefix}run2']),
      run3: stringType.mapFromDatabaseResponse(data['${effectivePrefix}run3']),
      run4: stringType.mapFromDatabaseResponse(data['${effectivePrefix}run4']),
      inn_changed: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}inn_changed']),
      total_inns:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}total_inns']),
      inn_runs:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}inn_runs']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || statkeeperFirestoreID != null) {
      map['statkeeper_firestore_i_d'] = Variable<String>(statkeeperFirestoreID);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    if (!nullToAbsent || play != null) {
      map['play'] = Variable<String>(play);
    }
    if (!nullToAbsent || batter != null) {
      map['batter'] = Variable<String>(batter);
    }
    if (!nullToAbsent || ondeck != null) {
      map['ondeck'] = Variable<String>(ondeck);
    }
    if (!nullToAbsent || team != null) {
      map['team'] = Variable<int>(team);
    }
    if (!nullToAbsent || base_1 != null) {
      map['base_1'] = Variable<String>(base_1);
    }
    if (!nullToAbsent || base_2 != null) {
      map['base_2'] = Variable<String>(base_2);
    }
    if (!nullToAbsent || base_3 != null) {
      map['base_3'] = Variable<String>(base_3);
    }
    if (!nullToAbsent || outs != null) {
      map['outs'] = Variable<int>(outs);
    }
    if (!nullToAbsent || awayteam_runs != null) {
      map['awayteam_runs'] = Variable<int>(awayteam_runs);
    }
    if (!nullToAbsent || hometeam_runs != null) {
      map['hometeam_runs'] = Variable<int>(hometeam_runs);
    }
    if (!nullToAbsent || run1 != null) {
      map['run1'] = Variable<String>(run1);
    }
    if (!nullToAbsent || run2 != null) {
      map['run2'] = Variable<String>(run2);
    }
    if (!nullToAbsent || run3 != null) {
      map['run3'] = Variable<String>(run3);
    }
    if (!nullToAbsent || run4 != null) {
      map['run4'] = Variable<String>(run4);
    }
    if (!nullToAbsent || inn_changed != null) {
      map['inn_changed'] = Variable<int>(inn_changed);
    }
    if (!nullToAbsent || total_inns != null) {
      map['total_inns'] = Variable<int>(total_inns);
    }
    if (!nullToAbsent || inn_runs != null) {
      map['inn_runs'] = Variable<int>(inn_runs);
    }
    return map;
  }

  PlaysCompanion toCompanion(bool nullToAbsent) {
    return PlaysCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      statkeeperFirestoreID: statkeeperFirestoreID == null && nullToAbsent
          ? const Value.absent()
          : Value(statkeeperFirestoreID),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      play: play == null && nullToAbsent ? const Value.absent() : Value(play),
      batter:
          batter == null && nullToAbsent ? const Value.absent() : Value(batter),
      ondeck:
          ondeck == null && nullToAbsent ? const Value.absent() : Value(ondeck),
      team: team == null && nullToAbsent ? const Value.absent() : Value(team),
      base_1:
          base_1 == null && nullToAbsent ? const Value.absent() : Value(base_1),
      base_2:
          base_2 == null && nullToAbsent ? const Value.absent() : Value(base_2),
      base_3:
          base_3 == null && nullToAbsent ? const Value.absent() : Value(base_3),
      outs: outs == null && nullToAbsent ? const Value.absent() : Value(outs),
      awayteam_runs: awayteam_runs == null && nullToAbsent
          ? const Value.absent()
          : Value(awayteam_runs),
      hometeam_runs: hometeam_runs == null && nullToAbsent
          ? const Value.absent()
          : Value(hometeam_runs),
      run1: run1 == null && nullToAbsent ? const Value.absent() : Value(run1),
      run2: run2 == null && nullToAbsent ? const Value.absent() : Value(run2),
      run3: run3 == null && nullToAbsent ? const Value.absent() : Value(run3),
      run4: run4 == null && nullToAbsent ? const Value.absent() : Value(run4),
      inn_changed: inn_changed == null && nullToAbsent
          ? const Value.absent()
          : Value(inn_changed),
      total_inns: total_inns == null && nullToAbsent
          ? const Value.absent()
          : Value(total_inns),
      inn_runs: inn_runs == null && nullToAbsent
          ? const Value.absent()
          : Value(inn_runs),
    );
  }

  factory Play.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Play(
      id: serializer.fromJson<int>(json['id']),
      statkeeperFirestoreID:
          serializer.fromJson<String>(json['statkeeperFirestoreID']),
      number: serializer.fromJson<int>(json['number']),
      play: serializer.fromJson<String>(json['play']),
      batter: serializer.fromJson<String>(json['batter']),
      ondeck: serializer.fromJson<String>(json['ondeck']),
      team: serializer.fromJson<int>(json['team']),
      base_1: serializer.fromJson<String>(json['base_1']),
      base_2: serializer.fromJson<String>(json['base_2']),
      base_3: serializer.fromJson<String>(json['base_3']),
      outs: serializer.fromJson<int>(json['outs']),
      awayteam_runs: serializer.fromJson<int>(json['awayteam_runs']),
      hometeam_runs: serializer.fromJson<int>(json['hometeam_runs']),
      run1: serializer.fromJson<String>(json['run1']),
      run2: serializer.fromJson<String>(json['run2']),
      run3: serializer.fromJson<String>(json['run3']),
      run4: serializer.fromJson<String>(json['run4']),
      inn_changed: serializer.fromJson<int>(json['inn_changed']),
      total_inns: serializer.fromJson<int>(json['total_inns']),
      inn_runs: serializer.fromJson<int>(json['inn_runs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'statkeeperFirestoreID': serializer.toJson<String>(statkeeperFirestoreID),
      'number': serializer.toJson<int>(number),
      'play': serializer.toJson<String>(play),
      'batter': serializer.toJson<String>(batter),
      'ondeck': serializer.toJson<String>(ondeck),
      'team': serializer.toJson<int>(team),
      'base_1': serializer.toJson<String>(base_1),
      'base_2': serializer.toJson<String>(base_2),
      'base_3': serializer.toJson<String>(base_3),
      'outs': serializer.toJson<int>(outs),
      'awayteam_runs': serializer.toJson<int>(awayteam_runs),
      'hometeam_runs': serializer.toJson<int>(hometeam_runs),
      'run1': serializer.toJson<String>(run1),
      'run2': serializer.toJson<String>(run2),
      'run3': serializer.toJson<String>(run3),
      'run4': serializer.toJson<String>(run4),
      'inn_changed': serializer.toJson<int>(inn_changed),
      'total_inns': serializer.toJson<int>(total_inns),
      'inn_runs': serializer.toJson<int>(inn_runs),
    };
  }

  Play copyWith(
          {int id,
          String statkeeperFirestoreID,
          int number,
          String play,
          String batter,
          String ondeck,
          int team,
          String base_1,
          String base_2,
          String base_3,
          int outs,
          int awayteam_runs,
          int hometeam_runs,
          String run1,
          String run2,
          String run3,
          String run4,
          int inn_changed,
          int total_inns,
          int inn_runs}) =>
      Play(
        id: id ?? this.id,
        statkeeperFirestoreID:
            statkeeperFirestoreID ?? this.statkeeperFirestoreID,
        number: number ?? this.number,
        play: play ?? this.play,
        batter: batter ?? this.batter,
        ondeck: ondeck ?? this.ondeck,
        team: team ?? this.team,
        base_1: base_1 ?? this.base_1,
        base_2: base_2 ?? this.base_2,
        base_3: base_3 ?? this.base_3,
        outs: outs ?? this.outs,
        awayteam_runs: awayteam_runs ?? this.awayteam_runs,
        hometeam_runs: hometeam_runs ?? this.hometeam_runs,
        run1: run1 ?? this.run1,
        run2: run2 ?? this.run2,
        run3: run3 ?? this.run3,
        run4: run4 ?? this.run4,
        inn_changed: inn_changed ?? this.inn_changed,
        total_inns: total_inns ?? this.total_inns,
        inn_runs: inn_runs ?? this.inn_runs,
      );
  @override
  String toString() {
    return (StringBuffer('Play(')
          ..write('id: $id, ')
          ..write('statkeeperFirestoreID: $statkeeperFirestoreID, ')
          ..write('number: $number, ')
          ..write('play: $play, ')
          ..write('batter: $batter, ')
          ..write('ondeck: $ondeck, ')
          ..write('team: $team, ')
          ..write('base_1: $base_1, ')
          ..write('base_2: $base_2, ')
          ..write('base_3: $base_3, ')
          ..write('outs: $outs, ')
          ..write('awayteam_runs: $awayteam_runs, ')
          ..write('hometeam_runs: $hometeam_runs, ')
          ..write('run1: $run1, ')
          ..write('run2: $run2, ')
          ..write('run3: $run3, ')
          ..write('run4: $run4, ')
          ..write('inn_changed: $inn_changed, ')
          ..write('total_inns: $total_inns, ')
          ..write('inn_runs: $inn_runs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          statkeeperFirestoreID.hashCode,
          $mrjc(
              number.hashCode,
              $mrjc(
                  play.hashCode,
                  $mrjc(
                      batter.hashCode,
                      $mrjc(
                          ondeck.hashCode,
                          $mrjc(
                              team.hashCode,
                              $mrjc(
                                  base_1.hashCode,
                                  $mrjc(
                                      base_2.hashCode,
                                      $mrjc(
                                          base_3.hashCode,
                                          $mrjc(
                                              outs.hashCode,
                                              $mrjc(
                                                  awayteam_runs.hashCode,
                                                  $mrjc(
                                                      hometeam_runs.hashCode,
                                                      $mrjc(
                                                          run1.hashCode,
                                                          $mrjc(
                                                              run2.hashCode,
                                                              $mrjc(
                                                                  run3.hashCode,
                                                                  $mrjc(
                                                                      run4
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          inn_changed
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              total_inns.hashCode,
                                                                              inn_runs.hashCode))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Play &&
          other.id == this.id &&
          other.statkeeperFirestoreID == this.statkeeperFirestoreID &&
          other.number == this.number &&
          other.play == this.play &&
          other.batter == this.batter &&
          other.ondeck == this.ondeck &&
          other.team == this.team &&
          other.base_1 == this.base_1 &&
          other.base_2 == this.base_2 &&
          other.base_3 == this.base_3 &&
          other.outs == this.outs &&
          other.awayteam_runs == this.awayteam_runs &&
          other.hometeam_runs == this.hometeam_runs &&
          other.run1 == this.run1 &&
          other.run2 == this.run2 &&
          other.run3 == this.run3 &&
          other.run4 == this.run4 &&
          other.inn_changed == this.inn_changed &&
          other.total_inns == this.total_inns &&
          other.inn_runs == this.inn_runs);
}

class PlaysCompanion extends UpdateCompanion<Play> {
  final Value<int> id;
  final Value<String> statkeeperFirestoreID;
  final Value<int> number;
  final Value<String> play;
  final Value<String> batter;
  final Value<String> ondeck;
  final Value<int> team;
  final Value<String> base_1;
  final Value<String> base_2;
  final Value<String> base_3;
  final Value<int> outs;
  final Value<int> awayteam_runs;
  final Value<int> hometeam_runs;
  final Value<String> run1;
  final Value<String> run2;
  final Value<String> run3;
  final Value<String> run4;
  final Value<int> inn_changed;
  final Value<int> total_inns;
  final Value<int> inn_runs;
  const PlaysCompanion({
    this.id = const Value.absent(),
    this.statkeeperFirestoreID = const Value.absent(),
    this.number = const Value.absent(),
    this.play = const Value.absent(),
    this.batter = const Value.absent(),
    this.ondeck = const Value.absent(),
    this.team = const Value.absent(),
    this.base_1 = const Value.absent(),
    this.base_2 = const Value.absent(),
    this.base_3 = const Value.absent(),
    this.outs = const Value.absent(),
    this.awayteam_runs = const Value.absent(),
    this.hometeam_runs = const Value.absent(),
    this.run1 = const Value.absent(),
    this.run2 = const Value.absent(),
    this.run3 = const Value.absent(),
    this.run4 = const Value.absent(),
    this.inn_changed = const Value.absent(),
    this.total_inns = const Value.absent(),
    this.inn_runs = const Value.absent(),
  });
  PlaysCompanion.insert({
    this.id = const Value.absent(),
    @required String statkeeperFirestoreID,
    @required int number,
    @required String play,
    @required String batter,
    @required String ondeck,
    @required int team,
    @required String base_1,
    @required String base_2,
    @required String base_3,
    @required int outs,
    @required int awayteam_runs,
    @required int hometeam_runs,
    @required String run1,
    @required String run2,
    @required String run3,
    @required String run4,
    @required int inn_changed,
    @required int total_inns,
    this.inn_runs = const Value.absent(),
  })  : statkeeperFirestoreID = Value(statkeeperFirestoreID),
        number = Value(number),
        play = Value(play),
        batter = Value(batter),
        ondeck = Value(ondeck),
        team = Value(team),
        base_1 = Value(base_1),
        base_2 = Value(base_2),
        base_3 = Value(base_3),
        outs = Value(outs),
        awayteam_runs = Value(awayteam_runs),
        hometeam_runs = Value(hometeam_runs),
        run1 = Value(run1),
        run2 = Value(run2),
        run3 = Value(run3),
        run4 = Value(run4),
        inn_changed = Value(inn_changed),
        total_inns = Value(total_inns);
  static Insertable<Play> custom({
    Expression<int> id,
    Expression<String> statkeeperFirestoreID,
    Expression<int> number,
    Expression<String> play,
    Expression<String> batter,
    Expression<String> ondeck,
    Expression<int> team,
    Expression<String> base_1,
    Expression<String> base_2,
    Expression<String> base_3,
    Expression<int> outs,
    Expression<int> awayteam_runs,
    Expression<int> hometeam_runs,
    Expression<String> run1,
    Expression<String> run2,
    Expression<String> run3,
    Expression<String> run4,
    Expression<int> inn_changed,
    Expression<int> total_inns,
    Expression<int> inn_runs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (statkeeperFirestoreID != null)
        'statkeeper_firestore_i_d': statkeeperFirestoreID,
      if (number != null) 'number': number,
      if (play != null) 'play': play,
      if (batter != null) 'batter': batter,
      if (ondeck != null) 'ondeck': ondeck,
      if (team != null) 'team': team,
      if (base_1 != null) 'base_1': base_1,
      if (base_2 != null) 'base_2': base_2,
      if (base_3 != null) 'base_3': base_3,
      if (outs != null) 'outs': outs,
      if (awayteam_runs != null) 'awayteam_runs': awayteam_runs,
      if (hometeam_runs != null) 'hometeam_runs': hometeam_runs,
      if (run1 != null) 'run1': run1,
      if (run2 != null) 'run2': run2,
      if (run3 != null) 'run3': run3,
      if (run4 != null) 'run4': run4,
      if (inn_changed != null) 'inn_changed': inn_changed,
      if (total_inns != null) 'total_inns': total_inns,
      if (inn_runs != null) 'inn_runs': inn_runs,
    });
  }

  PlaysCompanion copyWith(
      {Value<int> id,
      Value<String> statkeeperFirestoreID,
      Value<int> number,
      Value<String> play,
      Value<String> batter,
      Value<String> ondeck,
      Value<int> team,
      Value<String> base_1,
      Value<String> base_2,
      Value<String> base_3,
      Value<int> outs,
      Value<int> awayteam_runs,
      Value<int> hometeam_runs,
      Value<String> run1,
      Value<String> run2,
      Value<String> run3,
      Value<String> run4,
      Value<int> inn_changed,
      Value<int> total_inns,
      Value<int> inn_runs}) {
    return PlaysCompanion(
      id: id ?? this.id,
      statkeeperFirestoreID:
          statkeeperFirestoreID ?? this.statkeeperFirestoreID,
      number: number ?? this.number,
      play: play ?? this.play,
      batter: batter ?? this.batter,
      ondeck: ondeck ?? this.ondeck,
      team: team ?? this.team,
      base_1: base_1 ?? this.base_1,
      base_2: base_2 ?? this.base_2,
      base_3: base_3 ?? this.base_3,
      outs: outs ?? this.outs,
      awayteam_runs: awayteam_runs ?? this.awayteam_runs,
      hometeam_runs: hometeam_runs ?? this.hometeam_runs,
      run1: run1 ?? this.run1,
      run2: run2 ?? this.run2,
      run3: run3 ?? this.run3,
      run4: run4 ?? this.run4,
      inn_changed: inn_changed ?? this.inn_changed,
      total_inns: total_inns ?? this.total_inns,
      inn_runs: inn_runs ?? this.inn_runs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (statkeeperFirestoreID.present) {
      map['statkeeper_firestore_i_d'] =
          Variable<String>(statkeeperFirestoreID.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (play.present) {
      map['play'] = Variable<String>(play.value);
    }
    if (batter.present) {
      map['batter'] = Variable<String>(batter.value);
    }
    if (ondeck.present) {
      map['ondeck'] = Variable<String>(ondeck.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    if (base_1.present) {
      map['base_1'] = Variable<String>(base_1.value);
    }
    if (base_2.present) {
      map['base_2'] = Variable<String>(base_2.value);
    }
    if (base_3.present) {
      map['base_3'] = Variable<String>(base_3.value);
    }
    if (outs.present) {
      map['outs'] = Variable<int>(outs.value);
    }
    if (awayteam_runs.present) {
      map['awayteam_runs'] = Variable<int>(awayteam_runs.value);
    }
    if (hometeam_runs.present) {
      map['hometeam_runs'] = Variable<int>(hometeam_runs.value);
    }
    if (run1.present) {
      map['run1'] = Variable<String>(run1.value);
    }
    if (run2.present) {
      map['run2'] = Variable<String>(run2.value);
    }
    if (run3.present) {
      map['run3'] = Variable<String>(run3.value);
    }
    if (run4.present) {
      map['run4'] = Variable<String>(run4.value);
    }
    if (inn_changed.present) {
      map['inn_changed'] = Variable<int>(inn_changed.value);
    }
    if (total_inns.present) {
      map['total_inns'] = Variable<int>(total_inns.value);
    }
    if (inn_runs.present) {
      map['inn_runs'] = Variable<int>(inn_runs.value);
    }
    return map;
  }
}

class $PlaysTable extends Plays with TableInfo<$PlaysTable, Play> {
  final GeneratedDatabase _db;
  final String _alias;
  $PlaysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _statkeeperFirestoreIDMeta =
      const VerificationMeta('statkeeperFirestoreID');
  GeneratedTextColumn _statkeeperFirestoreID;
  @override
  GeneratedTextColumn get statkeeperFirestoreID =>
      _statkeeperFirestoreID ??= _constructStatkeeperFirestoreID();
  GeneratedTextColumn _constructStatkeeperFirestoreID() {
    return GeneratedTextColumn(
      'statkeeper_firestore_i_d',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedIntColumn _number;
  @override
  GeneratedIntColumn get number => _number ??= _constructNumber();
  GeneratedIntColumn _constructNumber() {
    return GeneratedIntColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _playMeta = const VerificationMeta('play');
  GeneratedTextColumn _play;
  @override
  GeneratedTextColumn get play => _play ??= _constructPlay();
  GeneratedTextColumn _constructPlay() {
    return GeneratedTextColumn(
      'play',
      $tableName,
      false,
    );
  }

  final VerificationMeta _batterMeta = const VerificationMeta('batter');
  GeneratedTextColumn _batter;
  @override
  GeneratedTextColumn get batter => _batter ??= _constructBatter();
  GeneratedTextColumn _constructBatter() {
    return GeneratedTextColumn(
      'batter',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ondeckMeta = const VerificationMeta('ondeck');
  GeneratedTextColumn _ondeck;
  @override
  GeneratedTextColumn get ondeck => _ondeck ??= _constructOndeck();
  GeneratedTextColumn _constructOndeck() {
    return GeneratedTextColumn(
      'ondeck',
      $tableName,
      false,
    );
  }

  final VerificationMeta _teamMeta = const VerificationMeta('team');
  GeneratedIntColumn _team;
  @override
  GeneratedIntColumn get team => _team ??= _constructTeam();
  GeneratedIntColumn _constructTeam() {
    return GeneratedIntColumn(
      'team',
      $tableName,
      false,
    );
  }

  final VerificationMeta _base_1Meta = const VerificationMeta('base_1');
  GeneratedTextColumn _base_1;
  @override
  GeneratedTextColumn get base_1 => _base_1 ??= _constructBase1();
  GeneratedTextColumn _constructBase1() {
    return GeneratedTextColumn(
      'base_1',
      $tableName,
      false,
    );
  }

  final VerificationMeta _base_2Meta = const VerificationMeta('base_2');
  GeneratedTextColumn _base_2;
  @override
  GeneratedTextColumn get base_2 => _base_2 ??= _constructBase2();
  GeneratedTextColumn _constructBase2() {
    return GeneratedTextColumn(
      'base_2',
      $tableName,
      false,
    );
  }

  final VerificationMeta _base_3Meta = const VerificationMeta('base_3');
  GeneratedTextColumn _base_3;
  @override
  GeneratedTextColumn get base_3 => _base_3 ??= _constructBase3();
  GeneratedTextColumn _constructBase3() {
    return GeneratedTextColumn(
      'base_3',
      $tableName,
      false,
    );
  }

  final VerificationMeta _outsMeta = const VerificationMeta('outs');
  GeneratedIntColumn _outs;
  @override
  GeneratedIntColumn get outs => _outs ??= _constructOuts();
  GeneratedIntColumn _constructOuts() {
    return GeneratedIntColumn(
      'outs',
      $tableName,
      false,
    );
  }

  final VerificationMeta _awayteam_runsMeta =
      const VerificationMeta('awayteam_runs');
  GeneratedIntColumn _awayteam_runs;
  @override
  GeneratedIntColumn get awayteam_runs =>
      _awayteam_runs ??= _constructAwayteamRuns();
  GeneratedIntColumn _constructAwayteamRuns() {
    return GeneratedIntColumn(
      'awayteam_runs',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hometeam_runsMeta =
      const VerificationMeta('hometeam_runs');
  GeneratedIntColumn _hometeam_runs;
  @override
  GeneratedIntColumn get hometeam_runs =>
      _hometeam_runs ??= _constructHometeamRuns();
  GeneratedIntColumn _constructHometeamRuns() {
    return GeneratedIntColumn(
      'hometeam_runs',
      $tableName,
      false,
    );
  }

  final VerificationMeta _run1Meta = const VerificationMeta('run1');
  GeneratedTextColumn _run1;
  @override
  GeneratedTextColumn get run1 => _run1 ??= _constructRun1();
  GeneratedTextColumn _constructRun1() {
    return GeneratedTextColumn(
      'run1',
      $tableName,
      false,
    );
  }

  final VerificationMeta _run2Meta = const VerificationMeta('run2');
  GeneratedTextColumn _run2;
  @override
  GeneratedTextColumn get run2 => _run2 ??= _constructRun2();
  GeneratedTextColumn _constructRun2() {
    return GeneratedTextColumn(
      'run2',
      $tableName,
      false,
    );
  }

  final VerificationMeta _run3Meta = const VerificationMeta('run3');
  GeneratedTextColumn _run3;
  @override
  GeneratedTextColumn get run3 => _run3 ??= _constructRun3();
  GeneratedTextColumn _constructRun3() {
    return GeneratedTextColumn(
      'run3',
      $tableName,
      false,
    );
  }

  final VerificationMeta _run4Meta = const VerificationMeta('run4');
  GeneratedTextColumn _run4;
  @override
  GeneratedTextColumn get run4 => _run4 ??= _constructRun4();
  GeneratedTextColumn _constructRun4() {
    return GeneratedTextColumn(
      'run4',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inn_changedMeta =
      const VerificationMeta('inn_changed');
  GeneratedIntColumn _inn_changed;
  @override
  GeneratedIntColumn get inn_changed => _inn_changed ??= _constructInnChanged();
  GeneratedIntColumn _constructInnChanged() {
    return GeneratedIntColumn(
      'inn_changed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _total_innsMeta = const VerificationMeta('total_inns');
  GeneratedIntColumn _total_inns;
  @override
  GeneratedIntColumn get total_inns => _total_inns ??= _constructTotalInns();
  GeneratedIntColumn _constructTotalInns() {
    return GeneratedIntColumn(
      'total_inns',
      $tableName,
      false,
    );
  }

  final VerificationMeta _inn_runsMeta = const VerificationMeta('inn_runs');
  GeneratedIntColumn _inn_runs;
  @override
  GeneratedIntColumn get inn_runs => _inn_runs ??= _constructInnRuns();
  GeneratedIntColumn _constructInnRuns() {
    return GeneratedIntColumn('inn_runs', $tableName, false,
        defaultValue: zero);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        statkeeperFirestoreID,
        number,
        play,
        batter,
        ondeck,
        team,
        base_1,
        base_2,
        base_3,
        outs,
        awayteam_runs,
        hometeam_runs,
        run1,
        run2,
        run3,
        run4,
        inn_changed,
        total_inns,
        inn_runs
      ];
  @override
  $PlaysTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'plays';
  @override
  final String actualTableName = 'plays';
  @override
  VerificationContext validateIntegrity(Insertable<Play> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('statkeeper_firestore_i_d')) {
      context.handle(
          _statkeeperFirestoreIDMeta,
          statkeeperFirestoreID.isAcceptableOrUnknown(
              data['statkeeper_firestore_i_d'], _statkeeperFirestoreIDMeta));
    } else if (isInserting) {
      context.missing(_statkeeperFirestoreIDMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('play')) {
      context.handle(
          _playMeta, play.isAcceptableOrUnknown(data['play'], _playMeta));
    } else if (isInserting) {
      context.missing(_playMeta);
    }
    if (data.containsKey('batter')) {
      context.handle(_batterMeta,
          batter.isAcceptableOrUnknown(data['batter'], _batterMeta));
    } else if (isInserting) {
      context.missing(_batterMeta);
    }
    if (data.containsKey('ondeck')) {
      context.handle(_ondeckMeta,
          ondeck.isAcceptableOrUnknown(data['ondeck'], _ondeckMeta));
    } else if (isInserting) {
      context.missing(_ondeckMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team'], _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('base_1')) {
      context.handle(_base_1Meta,
          base_1.isAcceptableOrUnknown(data['base_1'], _base_1Meta));
    } else if (isInserting) {
      context.missing(_base_1Meta);
    }
    if (data.containsKey('base_2')) {
      context.handle(_base_2Meta,
          base_2.isAcceptableOrUnknown(data['base_2'], _base_2Meta));
    } else if (isInserting) {
      context.missing(_base_2Meta);
    }
    if (data.containsKey('base_3')) {
      context.handle(_base_3Meta,
          base_3.isAcceptableOrUnknown(data['base_3'], _base_3Meta));
    } else if (isInserting) {
      context.missing(_base_3Meta);
    }
    if (data.containsKey('outs')) {
      context.handle(
          _outsMeta, outs.isAcceptableOrUnknown(data['outs'], _outsMeta));
    } else if (isInserting) {
      context.missing(_outsMeta);
    }
    if (data.containsKey('awayteam_runs')) {
      context.handle(
          _awayteam_runsMeta,
          awayteam_runs.isAcceptableOrUnknown(
              data['awayteam_runs'], _awayteam_runsMeta));
    } else if (isInserting) {
      context.missing(_awayteam_runsMeta);
    }
    if (data.containsKey('hometeam_runs')) {
      context.handle(
          _hometeam_runsMeta,
          hometeam_runs.isAcceptableOrUnknown(
              data['hometeam_runs'], _hometeam_runsMeta));
    } else if (isInserting) {
      context.missing(_hometeam_runsMeta);
    }
    if (data.containsKey('run1')) {
      context.handle(
          _run1Meta, run1.isAcceptableOrUnknown(data['run1'], _run1Meta));
    } else if (isInserting) {
      context.missing(_run1Meta);
    }
    if (data.containsKey('run2')) {
      context.handle(
          _run2Meta, run2.isAcceptableOrUnknown(data['run2'], _run2Meta));
    } else if (isInserting) {
      context.missing(_run2Meta);
    }
    if (data.containsKey('run3')) {
      context.handle(
          _run3Meta, run3.isAcceptableOrUnknown(data['run3'], _run3Meta));
    } else if (isInserting) {
      context.missing(_run3Meta);
    }
    if (data.containsKey('run4')) {
      context.handle(
          _run4Meta, run4.isAcceptableOrUnknown(data['run4'], _run4Meta));
    } else if (isInserting) {
      context.missing(_run4Meta);
    }
    if (data.containsKey('inn_changed')) {
      context.handle(
          _inn_changedMeta,
          inn_changed.isAcceptableOrUnknown(
              data['inn_changed'], _inn_changedMeta));
    } else if (isInserting) {
      context.missing(_inn_changedMeta);
    }
    if (data.containsKey('total_inns')) {
      context.handle(
          _total_innsMeta,
          total_inns.isAcceptableOrUnknown(
              data['total_inns'], _total_innsMeta));
    } else if (isInserting) {
      context.missing(_total_innsMeta);
    }
    if (data.containsKey('inn_runs')) {
      context.handle(_inn_runsMeta,
          inn_runs.isAcceptableOrUnknown(data['inn_runs'], _inn_runsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Play map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Play.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlaysTable createAlias(String alias) {
    return $PlaysTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $StatKeepersTable _statKeepers;
  $StatKeepersTable get statKeepers => _statKeepers ??= $StatKeepersTable(this);
  $TeamsTable _teams;
  $TeamsTable get teams => _teams ??= $TeamsTable(this);
  $PlayersTable _players;
  $PlayersTable get players => _players ??= $PlayersTable(this);
  $PlaysTable _plays;
  $PlaysTable get plays => _plays ??= $PlaysTable(this);
  StatKeeperDao _statKeeperDao;
  StatKeeperDao get statKeeperDao =>
      _statKeeperDao ??= StatKeeperDao(this as MyDatabase);
  TeamDao _teamDao;
  TeamDao get teamDao => _teamDao ??= TeamDao(this as MyDatabase);
  PlayerDao _playerDao;
  PlayerDao get playerDao => _playerDao ??= PlayerDao(this as MyDatabase);
  PlayDao _playDao;
  PlayDao get playDao => _playDao ??= PlayDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [statKeepers, teams, players, plays];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$StatKeeperDaoMixin on DatabaseAccessor<MyDatabase> {
  $StatKeepersTable get statKeepers => attachedDatabase.statKeepers;
}
mixin _$TeamDaoMixin on DatabaseAccessor<MyDatabase> {
  $TeamsTable get teams => attachedDatabase.teams;
}
mixin _$PlayerDaoMixin on DatabaseAccessor<MyDatabase> {
  $PlayersTable get players => attachedDatabase.players;
}
mixin _$PlayDaoMixin on DatabaseAccessor<MyDatabase> {
  $PlaysTable get plays => attachedDatabase.plays;
}
