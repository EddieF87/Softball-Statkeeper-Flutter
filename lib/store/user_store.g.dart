// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$statKeepersAtom = Atom(name: '_UserStore.statKeepers');

  @override
  ObservableList<StatKeeper> get statKeepers {
    _$statKeepersAtom.context.enforceReadPolicy(_$statKeepersAtom);
    _$statKeepersAtom.reportObserved();
    return super.statKeepers;
  }

  @override
  set statKeepers(ObservableList<StatKeeper> value) {
    _$statKeepersAtom.context.conditionallyRunInAction(() {
      super.statKeepers = value;
      _$statKeepersAtom.reportChanged();
    }, _$statKeepersAtom, name: '${_$statKeepersAtom.name}_set');
  }

  final _$updateStatKeepersAsyncAction = AsyncAction('updateStatKeepers');

  @override
  Future<dynamic> updateStatKeepers(FirebaseUser user) {
    return _$updateStatKeepersAsyncAction
        .run(() => super.updateStatKeepers(user));
  }

  final _$signOutAsyncAction = AsyncAction('signOut');

  @override
  Future<bool> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$getStatKeepersAsyncAction = AsyncAction('getStatKeepers');

  @override
  Future<ObservableList<StatKeeper>> getStatKeepers() {
    return _$getStatKeepersAsyncAction.run(() => super.getStatKeepers());
  }

  final _$addStatKeeperAsyncAction = AsyncAction('addStatKeeper');

  @override
  Future<dynamic> addStatKeeper(StatKeeper statKeeper) {
    return _$addStatKeeperAsyncAction
        .run(() => super.addStatKeeper(statKeeper));
  }

  final _$removeStatKeeperAsyncAction = AsyncAction('removeStatKeeper');

  @override
  Future<dynamic> removeStatKeeper(StatKeeper statKeeper) {
    return _$removeStatKeeperAsyncAction
        .run(() => super.removeStatKeeper(statKeeper));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void updateEmail(String email) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.updateEmail(email);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'statKeepers: ${statKeepers.toString()}';
    return '{$string}';
  }
}
