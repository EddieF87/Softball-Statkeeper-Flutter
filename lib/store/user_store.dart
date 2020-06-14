import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/main.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Include generated file
part 'user_store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore with Store {
  final StatKeeperDao statKeeperDao = database.statKeeperDao;
  final TeamDao teamDao = database.teamDao;
  final PlayerDao playerDao = database.playerDao;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String userID;

  Future _authenticateWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
  }

  @action
  Future updateStatKeepers(FirebaseUser user) async {
    Query query = Firestore.instance
        .collection("leagues")
        .where(user.uid, isLessThan: 99);

    QuerySnapshot s = await query.getDocuments();

    database.clear();

    s.documents.forEach((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> userData = documentSnapshot.data;

      var type = userData[DBContract.TYPE];
      if(kIsWeb && type == StatKeeperUtils.TYPE_PLAYER) {
        return;
      }
      var name = userData[DBContract.NAME];
      var firestoreID = documentSnapshot.documentID;

      StatKeeper statKeeper = StatKeeper(
        firestoreID: firestoreID,
        name: name,
        type: type,
        level: userData[user.uid],
      );

      statKeeperDao.insertStatKeeper(statKeeper);
      switch (type) {
        case StatKeeperUtils.TYPE_PLAYER:
          playerDao.insertPlayer(
            Player(
              name: name,
              firestoreID: firestoreID,
              teamfirestoreid: firestoreID,
              statkeeperFirestoreID: firestoreID,
            ),
          );
          break;
        case StatKeeperUtils.TYPE_TEAM:
          teamDao.insertTeam(
            Team(
              name: name,
              firestoreID: firestoreID,
              statkeeperFirestoreID: firestoreID,
            ),
          );
          break;
      }
    });
  }

  Future<FirebaseUser> retrieveCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null && user.uid != userID) {
      userID = user.uid;
      await updateStatKeepers(user);
    }
    return user;
  }

  Future<bool> signIn() async {
    await _authenticateWithGoogle();
    FirebaseUser user = await _auth.currentUser();
    if (user != null && user.uid != userID) {
      userID = user.uid;
      await updateStatKeepers(user);
    }
    return user != null;
  }

  @action
  Future<bool> signOut() async {
    await _auth.signOut();
    FirebaseUser user = await _auth.currentUser();
    bool signedOut = user == null;
    if (signedOut) {
      userID = null;
      statKeeperDao.clear();
    }
    return signedOut;
  }

  @action
  Future updateEmail(String email) async {
    await statKeeperDao.clear();
    email = email;
  }

  @action
  Stream<List<dynamic>> getStatKeepers() => statKeeperDao.watchAllStatKeepers();

  @action
  Future addStatKeeper(StatKeeper statKeeper) async =>
      await statKeeperDao.insertStatKeeper(statKeeper);

  @action
  Future removeStatKeeper(StatKeeper statKeeper) async =>
      await statKeeperDao.deleteStatKeeper(statKeeper);
}
