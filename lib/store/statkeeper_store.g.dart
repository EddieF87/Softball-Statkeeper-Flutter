// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statkeeper_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatKeeperStore on _StatKeeperStore, Store {
  final _$playerStatToUpdateAtom =
      Atom(name: '_StatKeeperStore.playerStatToUpdate');

  @override
  String get playerStatToUpdate {
    _$playerStatToUpdateAtom.reportRead();
    return super.playerStatToUpdate;
  }

  @override
  set playerStatToUpdate(String value) {
    _$playerStatToUpdateAtom.reportWrite(value, super.playerStatToUpdate, () {
      super.playerStatToUpdate = value;
    });
  }

  final _$showGenderAtom = Atom(name: '_StatKeeperStore.showGender');

  @override
  bool get showGender {
    _$showGenderAtom.reportRead();
    return super.showGender;
  }

  @override
  set showGender(bool value) {
    _$showGenderAtom.reportWrite(value, super.showGender, () {
      super.showGender = value;
    });
  }

  final _$populateStatKeeperAsyncAction =
      AsyncAction('_StatKeeperStore.populateStatKeeper');

  @override
  Future<dynamic> populateStatKeeper(String fireID) {
    return _$populateStatKeeperAsyncAction
        .run(() => super.populateStatKeeper(fireID));
  }

  final _$addPlayersAsyncAction = AsyncAction('_StatKeeperStore.addPlayers');

  @override
  Future<dynamic> addPlayers(
      int index, Map<int, String> playerNames, Map<int, bool> playerGenders) {
    return _$addPlayersAsyncAction
        .run(() => super.addPlayers(index, playerNames, playerGenders));
  }

  final _$addTeamsAsyncAction = AsyncAction('_StatKeeperStore.addTeams');

  @override
  Future<dynamic> addTeams(Map<int, String> teamNames) {
    return _$addTeamsAsyncAction.run(() => super.addTeams(teamNames));
  }

  final _$updatePlayerCountingStatAsyncAction =
      AsyncAction('_StatKeeperStore.updatePlayerCountingStat');

  @override
  Future<dynamic> updatePlayerCountingStat(int index, int amount) {
    return _$updatePlayerCountingStatAsyncAction
        .run(() => super.updatePlayerCountingStat(index, amount));
  }

  final _$_StatKeeperStoreActionController =
      ActionController(name: '_StatKeeperStore');

  @override
  dynamic sortPlayers(String statToSortBy) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction(
        name: '_StatKeeperStore.sortPlayers');
    try {
      return super.sortPlayers(statToSortBy);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sortTeams(String statToSortBy) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction(
        name: '_StatKeeperStore.sortTeams');
    try {
      return super.sortTeams(statToSortBy);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearStatKeeper() {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction(
        name: '_StatKeeperStore.clearStatKeeper');
    try {
      return super.clearStatKeeper();
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayerStatToUpdate(String stat) {
    final _$actionInfo = _$_StatKeeperStoreActionController.startAction(
        name: '_StatKeeperStore.setPlayerStatToUpdate');
    try {
      return super.setPlayerStatToUpdate(stat);
    } finally {
      _$_StatKeeperStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playerStatToUpdate: ${playerStatToUpdate},
showGender: ${showGender}
    ''';
  }
}
