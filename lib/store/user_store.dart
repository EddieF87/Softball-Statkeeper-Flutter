import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_statkeepers.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Include generated file
part 'user_store.g.dart';

// This is the class used by rest of your codebase
class UserStore = _UserStore with _$UserStore;

// The store-class
abstract class _UserStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String userID;

  @observable
  ObservableList<StatKeeper> statKeepers = ObservableList();

  Future _authenticateWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
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

    statKeepers.clear();
    s.documents.forEach((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> userData = documentSnapshot.data;
      StatKeeper statKeeper = StatKeeper.fromJson(userData, documentSnapshot.documentID, user.uid);
      statKeepers.add(statKeeper);
    });
    statKeepers = statKeepers;
  }

  Future<FirebaseUser> retrieveCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    if(user != null && user.uid != userID) {
      userID = user.uid;
      await updateStatKeepers(user);
    }
    return user;
  }

  Future<bool> signIn() async {
    await _authenticateWithGoogle();
    FirebaseUser user = await _auth.currentUser();
    if(user != null && user.uid != userID) {
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
    if(signedOut) {
      userID = null;
      statKeepers.clear();
      statKeepers = statKeepers;
    }
    return signedOut;
  }

  @action
  void updateEmail(String email) {
    statKeepers.clear();
    email = email;
  }
  
  @action
  Future<ObservableList<StatKeeper>> getStatKeepers() async {
    statKeepers.clear();
    statKeepers.addAll(ObservableList.of(
        await RepositoryServiceStatKeepers.getAllStatKeepers()));
    return statKeepers;
  }

  @action
  Future addStatKeeper(StatKeeper statKeeper) async {
    await RepositoryServiceStatKeepers.insertStatKeeper(statKeeper);
    statKeepers.add(statKeeper);
  }

  @action
  Future removeStatKeeper(StatKeeper statKeeper) async {
    await RepositoryServiceStatKeepers.deleteStatKeeper(statKeeper);
    statKeepers.remove(statKeeper);
  }
}
