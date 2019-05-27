// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$TeamStore on _TeamStore, Store {
  final _$teamAtom = Atom(name: '_TeamStore.team');

  @override
  Team get team {
    _$teamAtom.reportObserved();
    return super.team;
  }

  @override
  set team(Team value) {
    _$teamAtom.context.checkIfStateModificationsAreAllowed(_$teamAtom);
    super.team = value;
    _$teamAtom.reportChanged();
  }

  final _$playersAtom = Atom(name: '_TeamStore.players');

  @override
  ObservableList<Player> get players {
    _$playersAtom.reportObserved();
    return super.players;
  }

  @override
  set players(ObservableList<Player> value) {
    _$playersAtom.context.checkIfStateModificationsAreAllowed(_$playersAtom);
    super.players = value;
    _$playersAtom.reportChanged();
  }

  final _$setTeamFromDBAsyncAction = AsyncAction('setTeamFromDB');

  @override
  Future<dynamic> setTeamFromDB(String statKeeperFireID, String fireID) {
    return _$setTeamFromDBAsyncAction
        .run(() => super.setTeamFromDB(statKeeperFireID, fireID));
  }

  final _$getTeamFromDBAsyncAction = AsyncAction('getTeamFromDB');

  @override
  Future<Team> getTeamFromDB(String statKeeperFireID, String fireID) {
    return _$getTeamFromDBAsyncAction
        .run(() => super.getTeamFromDB(statKeeperFireID, fireID));
  }

  final _$populateTeamAsyncAction = AsyncAction('populateTeam');

  @override
  Future<dynamic> populateTeam(String statKeeperFireID, String fireID) {
    return _$populateTeamAsyncAction
        .run(() => super.populateTeam(statKeeperFireID, fireID));
  }

  final _$addPlayersAsyncAction = AsyncAction('addPlayers');

  @override
  Future<dynamic> addPlayers(Map<int, String> playerNames) {
    return _$addPlayersAsyncAction.run(() => super.addPlayers(playerNames));
  }

  final _$_TeamStoreActionController = ActionController(name: '_TeamStore');

  @override
  dynamic setTeam(Team newTeam) {
    final _$actionInfo = _$_TeamStoreActionController.startAction();
    try {
      return super.setTeam(newTeam);
    } finally {
      _$_TeamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTeam() {
    final _$actionInfo = _$_TeamStoreActionController.startAction();
    try {
      return super.clearTeam();
    } finally {
      _$_TeamStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortPlayers(String statToSortBy) {
    final _$actionInfo = _$_TeamStoreActionController.startAction();
    try {
      return super.sortPlayers(statToSortBy);
    } finally {
      _$_TeamStoreActionController.endAction(_$actionInfo);
    }
  }
}
