// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStore, Store {
  final _$batterAtom = Atom(name: '_GameStore.batter');

  @override
  dynamic get batter {
    _$batterAtom.reportRead();
    return super.batter;
  }

  @override
  set batter(dynamic value) {
    _$batterAtom.reportWrite(value, super.batter, () {
      super.batter = value;
    });
  }

  final _$batterIDAtom = Atom(name: '_GameStore.batterID');

  @override
  String get batterID {
    _$batterIDAtom.reportRead();
    return super.batterID;
  }

  @override
  set batterID(String value) {
    _$batterIDAtom.reportWrite(value, super.batterID, () {
      super.batterID = value;
    });
  }

  final _$playResetAtom = Atom(name: '_GameStore.playReset');

  @override
  bool get playReset {
    _$playResetAtom.reportRead();
    return super.playReset;
  }

  @override
  set playReset(bool value) {
    _$playResetAtom.reportWrite(value, super.playReset, () {
      super.playReset = value;
    });
  }

  final _$playResultAtom = Atom(name: '_GameStore.playResult');

  @override
  String get playResult {
    _$playResultAtom.reportRead();
    return super.playResult;
  }

  @override
  set playResult(String value) {
    _$playResultAtom.reportWrite(value, super.playResult, () {
      super.playResult = value;
    });
  }

  final _$awayTeamRunsAtom = Atom(name: '_GameStore.awayTeamRuns');

  @override
  int get awayTeamRuns {
    _$awayTeamRunsAtom.reportRead();
    return super.awayTeamRuns;
  }

  @override
  set awayTeamRuns(int value) {
    _$awayTeamRunsAtom.reportWrite(value, super.awayTeamRuns, () {
      super.awayTeamRuns = value;
    });
  }

  final _$homeTeamRunsAtom = Atom(name: '_GameStore.homeTeamRuns');

  @override
  int get homeTeamRuns {
    _$homeTeamRunsAtom.reportRead();
    return super.homeTeamRuns;
  }

  @override
  set homeTeamRuns(int value) {
    _$homeTeamRunsAtom.reportWrite(value, super.homeTeamRuns, () {
      super.homeTeamRuns = value;
    });
  }

  final _$inningsAtom = Atom(name: '_GameStore.innings');

  @override
  int get innings {
    _$inningsAtom.reportRead();
    return super.innings;
  }

  @override
  set innings(int value) {
    _$inningsAtom.reportWrite(value, super.innings, () {
      super.innings = value;
    });
  }

  final _$outsAtom = Atom(name: '_GameStore.outs');

  @override
  int get outs {
    _$outsAtom.reportRead();
    return super.outs;
  }

  @override
  set outs(int value) {
    _$outsAtom.reportWrite(value, super.outs, () {
      super.outs = value;
    });
  }

  final _$_retrieveBatterAsyncAction =
      AsyncAction('_GameStore._retrieveBatter');

  @override
  Future<dynamic> _retrieveBatter() {
    return _$_retrieveBatterAsyncAction.run(() => super._retrieveBatter());
  }

  final _$onSubmitPlayAsyncAction = AsyncAction('_GameStore.onSubmitPlay');

  @override
  Future<dynamic> onSubmitPlay() {
    return _$onSubmitPlayAsyncAction.run(() => super.onSubmitPlay());
  }

  final _$retrievePlayAsyncAction = AsyncAction('_GameStore.retrievePlay');

  @override
  Future<dynamic> retrievePlay() {
    return _$retrievePlayAsyncAction.run(() => super.retrievePlay());
  }

  final _$_GameStoreActionController = ActionController(name: '_GameStore');

  @override
  void onReset() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.onReset');
    try {
      return super.onReset();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextBatter() {
    final _$actionInfo =
        _$_GameStoreActionController.startAction(name: '_GameStore.nextBatter');
    try {
      return super.nextBatter();
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onResultEntered(String result) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore._onResultEntered');
    try {
      return super._onResultEntered(result);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addRunAndRBI(dynamic p) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore.addRunAndRBI');
    try {
      return super.addRunAndRBI(p);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayResult(String result) {
    final _$actionInfo = _$_GameStoreActionController.startAction(
        name: '_GameStore.setPlayResult');
    try {
      return super.setPlayResult(result);
    } finally {
      _$_GameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
batter: ${batter},
batterID: ${batterID},
playReset: ${playReset},
playResult: ${playResult},
awayTeamRuns: ${awayTeamRuns},
homeTeamRuns: ${homeTeamRuns},
innings: ${innings},
outs: ${outs}
    ''';
  }
}
