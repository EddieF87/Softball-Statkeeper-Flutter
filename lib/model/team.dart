import 'package:meta/meta.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class Team {
  int id;
  String firestoreID;
  String leagueFirestoreID;
  String name;
  int wins;
  int losses;
  int ties;
  int runsScored;
  int runsAllowed;
  List<Player> players;

  Team({
    this.id,
    @required this.firestoreID,
    @required this.name,
    this.leagueFirestoreID,
    this.wins = 0,
    this.losses = 0,
    this.ties = 0,
    this.runsScored = 0,
    this.runsAllowed = 0,
  })  : assert(firestoreID != null),
        assert(name != null);

  Team.fromJson(Map<String, dynamic> json) {
    this.firestoreID = json[DBContract.FIRESTORE_ID];
    this.leagueFirestoreID = json[DBContract.LEAGUE_FIRESTORE_ID];
    this.name = json[DBContract.NAME];
    this.wins = json[DBContract.TEAM];
    this.losses = json[DBContract.TEAM];
    this.ties = json[DBContract.TEAM];
    this.runsScored = json[DBContract.TEAM];
    this.runsAllowed = json[DBContract.TEAM];
  }
}
