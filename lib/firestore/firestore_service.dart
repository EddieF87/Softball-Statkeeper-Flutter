import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_teams.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
import 'package:sleekstats_flutter_statkeeper/model/team.dart';

class FirestoreService {
  static Future<List<Player>> getPlayers(String sKID) async {
    print("getPlayers  $sKID");
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("leagues/$sKID/players")
        .getDocuments();

    List<DocumentSnapshot> documentSnapshots = querySnapshot.documents;

    List<Player> players = List<Player>();

    for (DocumentSnapshot documentSnapshot in documentSnapshots) {
      String id = documentSnapshot.documentID;
      Player player = Player.fromFirestore(documentSnapshot.data, sKID, id);
      player.id = await RepositoryServicePlayers.insertPlayer(player);
      players.add(player);
    }
    return players;
  }

  static Future<List<Team>> getTeams(String sKID) async {
    print("getTeams  $sKID");
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("leagues/$sKID/teams")
        .getDocuments();

    List<DocumentSnapshot> documentSnapshots = querySnapshot.documents;

    List<Team> teams = List<Team>();

    for (DocumentSnapshot documentSnapshot in documentSnapshots) {
      String id = documentSnapshot.documentID;
      Team team = Team.fromFirestore(documentSnapshot.data, sKID, id);
      team.id = await RepositoryServiceTeams.insertTeam(team);
      teams.add(team);
    }
    print("teams = ${teams.length}");
    return teams;
  }
}
