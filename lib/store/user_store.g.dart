// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$updateStatKeepersAsyncAction =
      AsyncAction('_UserStore.updateStatKeepers');

  @override
  Future<dynamic> updateStatKeepers(FirebaseUser user) {
    return _$updateStatKeepersAsyncAction
        .run(() => super.updateStatKeepers(user));
  }

  final _$signOutAsyncAction = AsyncAction('_UserStore.signOut');

  @override
  Future<bool> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$updateEmailAsyncAction = AsyncAction('_UserStore.updateEmail');

  @override
  Future<dynamic> updateEmail(String email) {
    return _$updateEmailAsyncAction.run(() => super.updateEmail(email));
  }

  final _$addStatKeeperAsyncAction = AsyncAction('_UserStore.addStatKeeper');

  @override
  Future<dynamic> addStatKeeper(dynamic statKeeper) {
    return _$addStatKeeperAsyncAction
        .run(() => super.addStatKeeper(statKeeper));
  }

  final _$removeStatKeeperAsyncAction =
      AsyncAction('_UserStore.removeStatKeeper');

  @override
  Future<dynamic> removeStatKeeper(dynamic statKeeper) {
    return _$removeStatKeeperAsyncAction
        .run(() => super.removeStatKeeper(statKeeper));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  Stream<List<dynamic>> getStatKeepers() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getStatKeepers');
    try {
      return super.getStatKeepers();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
