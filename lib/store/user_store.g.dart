// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserStore on _UserStore, Store {
  final _$userEmailAtom = Atom(name: '_UserStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportObserved();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.context
        .checkIfStateModificationsAreAllowed(_$userEmailAtom);
    super.userEmail = value;
    _$userEmailAtom.reportChanged();
  }

  final _$statKeepersAtom = Atom(name: '_UserStore.statKeepers');

  @override
  ObservableList<StatKeeper> get statKeepers {
    _$statKeepersAtom.reportObserved();
    return super.statKeepers;
  }

  @override
  set statKeepers(ObservableList<StatKeeper> value) {
    _$statKeepersAtom.context
        .checkIfStateModificationsAreAllowed(_$statKeepersAtom);
    super.statKeepers = value;
    _$statKeepersAtom.reportChanged();
  }

  final _$getStatKeepersAsyncAction = AsyncAction('getStatKeepers');

  @override
  Future<ObservableList<StatKeeper>> getStatKeepers() {
    return _$getStatKeepersAsyncAction.run(() => super.getStatKeepers());
  }

  final _$updateStatKeepersAsyncAction = AsyncAction('updateStatKeepers');

  @override
  Future<dynamic> updateStatKeepers() {
    return _$updateStatKeepersAsyncAction.run(() => super.updateStatKeepers());
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
}
