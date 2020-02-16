// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statkeeper_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatKeeperStore on _StatKeeperStore, Store {
  final _$teamsAtom = Atom(name: '_StatKeeperStore.teams');

  @override
  ObservableList<Team> get teams {
    _$teamsAtom.context.enforceReadPolicy(_$teamsAtom);
    _$teamsAtom.reportObserved();
    return super.teams;
  }

  @override
  set teams(ObservableList<Team> value) {
    _$teamsAtom.context.conditionallyRunInAction(() {
      super.teams = value;
      _$teamsAtom.reportChanged();
    }, _$teamsAtom, name: '${_$teamsAtom.name}_set');
  }

  final _$playersAtom = Atom(name: '_StatKeeperStore.players');

  @override
  ObservableList<Player> get players {
    _$playersAtom.context.enforceReadPolicy(_$playersAtom);
    _$playersAtom.reportObserved();
    return super.players;
  }

  @override
  set players(ObservableList<Player> value) {
    _$playersAtom.context.conditionallyRunInAction(() {
      super.players = value;
      _$playersAtom.reportChanged();
    }, _$playersAtom, name: '${_$playersAtom.name}_set');
  }

  final _$playerStatToUpdateAtom =
      Atom(name: '_StatKeeperStore.playerStatToUpdate');

  @override
  String get playerStatToUpdate {
    _$playerStatToUpdateAtom.context
        .enforceReadPolicy(_$playerStatToUpdateAtom);
    _$playerStatToUpdateAtom.reportObserved();
    return super.playerStatToUpdate;
  }

  @override
  set playerStatToUpdate(String value) {
    _$playerStatToUpdateAtom.context.conditionallyRunInAction(() {
      super.playerStatToUpdate = value;
      _$playerStatToUpdateAtom.reportChanged();
    }, _$playerStatToUpdateAtom, name: '${_$playerStatToUpdateAtom.name}_set');
  }

  final _$populateStatKeeperAsyncAction = AsyncAction('populateStatKeeper');

  @override
  Future<dynamic> populateStatKeeper(String fireID) {
    return _$populateStatKeeperAsyncAction
        .run(() => super.populateStatKeeper(fireID));
  }

  final _$addPlayersAsyncAction = AsyncAction('addPlayers');

  @override
  Future<dynamic> addPlayers(int index, Map<int, String> playerNames) {
    return _$addPlayersAsyncAction
        .run(() => super.addPlayers(index, playerNames));
  }

  final _$addTeamsAsyncAction = AsyncAction('addTeams');

  @override
  Future<dynamic> addTeams(Map<int, String> teamNames) {
    return _$addTeamsAsyncAction.run(() => super.addTeams(teamNames));
  }

  final _$updatePlayerCountingStatAsyncAction =
      AsyncAction('updatePlayerCountingStat');

  @override
  Future<dynamic> updatePlayerCountingStat(int index, int amount) {
    return _$updatePlayerCountingStatAsyncAction
        .run(() => super.updatePlayerCountingStat(index, amount));
  }

  final _$_StatKeeperStoreActionController =
      ActionController(name: '_StatKeeperStore');

  @override
  dynamic sortPlayers(String statToSortBy) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction();
    try {
      return super.sortPlayers(statToSortBy);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortTeams(String statToSortBy) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction();
    try {
      return super.sortTeams(statToSortBy);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStatKeeper() {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction();
    try {
      return super.clearStatKeeper();
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayerStatToUpdate(String stat) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction();
    try {
      return super.setPlayerStatToUpdate(stat);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'teams: ${teams.toString()},players: ${players.toString()},playerStatToUpdate: ${playerStatToUpdate.toString()}';
    return '{$string}';
  }
}
