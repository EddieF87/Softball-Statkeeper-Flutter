// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameStore on _GameStore, Store {
  final _$batterAtom = Atom(name: '_GameStore.batter');

  @override
  Player get batter {
    _$batterAtom.context.enforceReadPolicy(_$batterAtom);
    _$batterAtom.reportObserved();
    return super.batter;
  }

  @override
  set batter(Player value) {
    _$batterAtom.context.conditionallyRunInAction(() {
      super.batter = value;
      _$batterAtom.reportChanged();
    }, _$batterAtom, name: '${_$batterAtom.name}_set');
  }

  final _$batterIDAtom = Atom(name: '_GameStore.batterID');

  @override
  String get batterID {
    _$batterIDAtom.context.enforceReadPolicy(_$batterIDAtom);
    _$batterIDAtom.reportObserved();
    return super.batterID;
  }

  @override
  set batterID(String value) {
    _$batterIDAtom.context.conditionallyRunInAction(() {
      super.batterID = value;
      _$batterIDAtom.reportChanged();
    }, _$batterIDAtom, name: '${_$batterIDAtom.name}_set');
  }

  final _$playResetAtom = Atom(name: '_GameStore.playReset');

  @override
  bool get playReset {
    _$playResetAtom.context.enforceReadPolicy(_$playResetAtom);
    _$playResetAtom.reportObserved();
    return super.playReset;
  }

  @override
  set playReset(bool value) {
    _$playResetAtom.context.conditionallyRunInAction(() {
      super.playReset = value;
      _$playResetAtom.reportChanged();
    }, _$playResetAtom, name: '${_$playResetAtom.name}_set');
  }

  final _$playResultAtom = Atom(name: '_GameStore.playResult');

  @override
  String get playResult {
    _$playResultAtom.context.enforceReadPolicy(_$playResultAtom);
    _$playResultAtom.reportObserved();
    return super.playResult;
  }

  @override
  set playResult(String value) {
    _$playResultAtom.context.conditionallyRunInAction(() {
      super.playResult = value;
      _$playResultAtom.reportChanged();
    }, _$playResultAtom, name: '${_$playResultAtom.name}_set');
  }

  final _$awayTeamRunsAtom = Atom(name: '_GameStore.awayTeamRuns');

  @override
  int get awayTeamRuns {
    _$awayTeamRunsAtom.context.enforceReadPolicy(_$awayTeamRunsAtom);
    _$awayTeamRunsAtom.reportObserved();
    return super.awayTeamRuns;
  }

  @override
  set awayTeamRuns(int value) {
    _$awayTeamRunsAtom.context.conditionallyRunInAction(() {
      super.awayTeamRuns = value;
      _$awayTeamRunsAtom.reportChanged();
    }, _$awayTeamRunsAtom, name: '${_$awayTeamRunsAtom.name}_set');
  }

  final _$homeTeamRunsAtom = Atom(name: '_GameStore.homeTeamRuns');

  @override
  int get homeTeamRuns {
    _$homeTeamRunsAtom.context.enforceReadPolicy(_$homeTeamRunsAtom);
    _$homeTeamRunsAtom.reportObserved();
    return super.homeTeamRuns;
  }

  @override
  set homeTeamRuns(int value) {
    _$homeTeamRunsAtom.context.conditionallyRunInAction(() {
      super.homeTeamRuns = value;
      _$homeTeamRunsAtom.reportChanged();
    }, _$homeTeamRunsAtom, name: '${_$homeTeamRunsAtom.name}_set');
  }

  final _$inningsAtom = Atom(name: '_GameStore.innings');

  @override
  int get innings {
    _$inningsAtom.context.enforceReadPolicy(_$inningsAtom);
    _$inningsAtom.reportObserved();
    return super.innings;
  }

  @override
  set innings(int value) {
    _$inningsAtom.context.conditionallyRunInAction(() {
      super.innings = value;
      _$inningsAtom.reportChanged();
    }, _$inningsAtom, name: '${_$inningsAtom.name}_set');
  }

  final _$outsAtom = Atom(name: '_GameStore.outs');

  @override
  int get outs {
    _$outsAtom.context.enforceReadPolicy(_$outsAtom);
    _$outsAtom.reportObserved();
    return super.outs;
  }

  @override
  set outs(int value) {
    _$outsAtom.context.conditionallyRunInAction(() {
      super.outs = value;
      _$outsAtom.reportChanged();
    }, _$outsAtom, name: '${_$outsAtom.name}_set');
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

  @override
  String toString() {
    final string =
        'batter: ${batter.toString()},batterID: ${batterID.toString()},playReset: ${playReset.toString()},playResult: ${playResult.toString()},awayTeamRuns: ${awayTeamRuns.toString()},homeTeamRuns: ${homeTeamRuns.toString()},innings: ${innings.toString()},outs: ${outs.toString()}';
    return '{$string}';
  }
}
