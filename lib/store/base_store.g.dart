// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseStore on _BaseStore, Store {
  final _$basesAtom = Atom(name: '_BaseStore.bases');

  @override
  ObservableList<Player> get bases {
    _$basesAtom.context.enforceReadPolicy(_$basesAtom);
    _$basesAtom.reportObserved();
    return super.bases;
  }

  @override
  set bases(ObservableList<Player> value) {
    _$basesAtom.context.conditionallyRunInAction(() {
      super.bases = value;
      _$basesAtom.reportChanged();
    }, _$basesAtom, name: '${_$basesAtom.name}_set');
  }

  final _$_BaseStoreActionController = ActionController(name: '_BaseStore');

  @override
  void resetBases() {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.resetBases();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBases(List<Player> newBases) {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.setBases(newBases);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateBase(int newBaseIndex, int currentBaseIndex) {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.updateBase(newBaseIndex, currentBaseIndex);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBatter(Player batter) {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.setBatter(batter);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onBatterMoved() {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.onBatterMoved();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRunnerMoved(int baseIndex) {
    final _$actionInfo = _$_BaseStoreActionController.startAction();
    try {
      return super.onRunnerMoved(baseIndex);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'bases: ${bases.toString()}';
    return '{$string}';
  }
}
