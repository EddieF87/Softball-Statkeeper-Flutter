// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$LeagueStore on _LeagueStore, Store {
  final _$teamsAtom = Atom(name: '_LeagueStore.teams');

  @override
  ObservableList<Team> get teams {
    _$teamsAtom.reportObserved();
    return super.teams;
  }

  @override
  set teams(ObservableList<Team> value) {
    _$teamsAtom.context.checkIfStateModificationsAreAllowed(_$teamsAtom);
    super.teams = value;
    _$teamsAtom.reportChanged();
  }

  final _$playersAtom = Atom(name: '_LeagueStore.players');

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

  final _$populateLeagueAsyncAction = AsyncAction('populateLeague');

  @override
  Future<dynamic> populateLeague(String fireID) {
    return _$populateLeagueAsyncAction.run(() => super.populateLeague(fireID));
  }

  final _$_LeagueStoreActionController = ActionController(name: '_LeagueStore');

  @override
  dynamic sortPlayers(String statToSortBy) {
    final _$actionInfo = _$_LeagueStoreActionController.startAction();
    try {
      return super.sortPlayers(statToSortBy);
    } finally {
      _$_LeagueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearLeague() {
    final _$actionInfo = _$_LeagueStoreActionController.startAction();
    try {
      return super.clearLeague();
    } finally {
      _$_LeagueStoreActionController.endAction(_$actionInfo);
    }
  }
}
