// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PlayerStore on _PlayerStore, Store {
  final _$playerAtom = Atom(name: '_PlayerStore.player');

  @override
  Player get player {
    _$playerAtom.reportObserved();
    return super.player;
  }

  @override
  set player(Player value) {
    _$playerAtom.context.checkIfStateModificationsAreAllowed(_$playerAtom);
    super.player = value;
    _$playerAtom.reportChanged();
  }

  final _$statToUpdateAtom = Atom(name: '_PlayerStore.statToUpdate');

  @override
  String get statToUpdate {
    _$statToUpdateAtom.reportObserved();
    return super.statToUpdate;
  }

  @override
  set statToUpdate(String value) {
    _$statToUpdateAtom.context
        .checkIfStateModificationsAreAllowed(_$statToUpdateAtom);
    super.statToUpdate = value;
    _$statToUpdateAtom.reportChanged();
  }

  final _$setPlayerFromDBAsyncAction = AsyncAction('setPlayerFromDB');

  @override
  Future<dynamic> setPlayerFromDB(String statKeeperFireID, String fireID) {
    return _$setPlayerFromDBAsyncAction
        .run(() => super.setPlayerFromDB(statKeeperFireID, fireID));
  }

  final _$getPlayerFromDBAsyncAction = AsyncAction('getPlayerFromDB');

  @override
  Future<Player> getPlayerFromDB(String statKeeperFireID, String fireID) {
    return _$getPlayerFromDBAsyncAction
        .run(() => super.getPlayerFromDB(statKeeperFireID, fireID));
  }

  final _$updateCountingStatAsyncAction = AsyncAction('updateCountingStat');

  @override
  Future<dynamic> updateCountingStat(int amount) {
    return _$updateCountingStatAsyncAction
        .run(() => super.updateCountingStat(amount));
  }

  final _$_PlayerStoreActionController = ActionController(name: '_PlayerStore');

  @override
  dynamic setStatToUpdate(String stat) {
    final _$actionInfo = _$_PlayerStoreActionController.startAction();
    try {
      return super.setStatToUpdate(stat);
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPlayer(Player newPlayer) {
    final _$actionInfo = _$_PlayerStoreActionController.startAction();
    try {
      return super.setPlayer(newPlayer);
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }
}
