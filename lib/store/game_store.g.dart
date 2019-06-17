// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$GameStore on _GameStore, Store {
  final _$batterAtom = Atom(name: '_GameStore.batter');

  @override
  Player get batter {
    _$batterAtom.reportObserved();
    return super.batter;
  }

  @override
  set batter(Player value) {
    _$batterAtom.context.checkIfStateModificationsAreAllowed(_$batterAtom);
    super.batter = value;
    _$batterAtom.reportChanged();
  }

  final _$batterIDAtom = Atom(name: '_GameStore.batterID');

  @override
  String get batterID {
    _$batterIDAtom.reportObserved();
    return super.batterID;
  }

  @override
  set batterID(String value) {
    _$batterIDAtom.context.checkIfStateModificationsAreAllowed(_$batterIDAtom);
    super.batterID = value;
    _$batterIDAtom.reportChanged();
  }

  final _$playResetAtom = Atom(name: '_GameStore.playReset');

  @override
  bool get playReset {
    _$playResetAtom.reportObserved();
    return super.playReset;
  }

  @override
  set playReset(bool value) {
    _$playResetAtom.context
        .checkIfStateModificationsAreAllowed(_$playResetAtom);
    super.playReset = value;
    _$playResetAtom.reportChanged();
  }

  final _$playResultAtom = Atom(name: '_GameStore.playResult');

  @override
  String get playResult {
    _$playResultAtom.reportObserved();
    return super.playResult;
  }

  @override
  set playResult(String value) {
    _$playResultAtom.context
        .checkIfStateModificationsAreAllowed(_$playResultAtom);
    super.playResult = value;
    _$playResultAtom.reportChanged();
  }

  final _$awayTeamRunsAtom = Atom(name: '_GameStore.awayTeamRuns');

  @override
  int get awayTeamRuns {
    _$awayTeamRunsAtom.reportObserved();
    return super.awayTeamRuns;
  }

  @override
  set awayTeamRuns(int value) {
    _$awayTeamRunsAtom.context
        .checkIfStateModificationsAreAllowed(_$awayTeamRunsAtom);
    super.awayTeamRuns = value;
    _$awayTeamRunsAtom.reportChanged();
  }

  final _$homeTeamRunsAtom = Atom(name: '_GameStore.homeTeamRuns');

  @override
  int get homeTeamRuns {
    _$homeTeamRunsAtom.reportObserved();
    return super.homeTeamRuns;
  }

  @override
  set homeTeamRuns(int value) {
    _$homeTeamRunsAtom.context
        .checkIfStateModificationsAreAllowed(_$homeTeamRunsAtom);
    super.homeTeamRuns = value;
    _$homeTeamRunsAtom.reportChanged();
  }

  final _$inningsAtom = Atom(name: '_GameStore.innings');

  @override
  int get innings {
    _$inningsAtom.reportObserved();
    return super.innings;
  }

  @override
  set innings(int value) {
    _$inningsAtom.context.checkIfStateModificationsAreAllowed(_$inningsAtom);
    super.innings = value;
    _$inningsAtom.reportChanged();
  }

  final _$outsAtom = Atom(name: '_GameStore.outs');

  @override
  int get outs {
    _$outsAtom.reportObserved();
    return super.outs;
  }

  @override
  set outs(int value) {
    _$outsAtom.context.checkIfStateModificationsAreAllowed(_$outsAtom);
    super.outs = value;
    _$outsAtom.reportChanged();
  }

  final _$_retrieveBatterAsyncAction = AsyncAction('_retrieveBatter');

  @override
  Future<dynamic> _retrieveBatter() {
    return _$_retrieveBatterAsyncAction.run(() => super._retrieveBatter());
  }

  final _$onSubmitPlayAsyncAction = AsyncAction('onSubmitPlay');

  @override
  Future<dynamic> onSubmitPlay() {
    return _$onSubmitPlayAsyncAction.run(() => super.onSubmitPlay());
  }

  final _$retrievePlayAsyncAction = AsyncAction('retrievePlay');

  @override
  Future<dynamic> retrievePlay() {
    return _$retrievePlayAsyncAction.run(() => super.retrievePlay());
  }

  final _$_GameStoreActionController = ActionController(name: '_GameStore');

  @override
  void onReset() {
    final _$actionInfo = _$_GameStoreActionController.startAction();
    try {
      return super.onReset();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextBatter() {
    final _$actionInfo = _$_GameStoreActionController.startAction();
    try {
      return super.nextBatter();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onResultEntered(String result) {
    final _$actionInfo = _$_GameStoreActionController.startAction();
    try {
      return super._onResultEntered(result);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addRunAndRBI(Player p) {
    final _$actionInfo = _$_GameStoreActionController.startAction();
    try {
      return super.addRunAndRBI(p);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayResult(String result) {
    final _$actionInfo = _$_GameStoreActionController.startAction();
    try {
      return super.setPlayResult(result);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }
}
