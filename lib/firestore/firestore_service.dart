import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';
import 'package:sleekstats_flutter_statkeeper/main.dart';
import 'package:sleekstats_flutter_statkeeper/model/player_utils.dart';
import 'package:sleekstats_flutter_statkeeper/model/team_utils.dart';
import 'package:sleekstats_flutter_statkeeper/utils/extensions.dart';

class FirestoreService {
  static loadPlayers(String sKID) async {
    print("getPlayers  $sKID");
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("leagues/$sKID/players")
        .getDocuments();

    List<DocumentSnapshot> documentSnapshots = querySnapshot.documents;

    List<Player> players = List<Player>();

    for (DocumentSnapshot documentSnapshot in documentSnapshots) {
      String firestoreID = documentSnapshot.documentID;
      Player cloudPlayer = PlayerUtils.fromFirestore(documentSnapshot.data, sKID, firestoreID);
      Player localPlayer = (await database.playerDao.getPlayer(sKID, firestoreID)).firstOrNull;

      if(localPlayer != null) {
        players.add(localPlayer);
      } else {
        database.playerDao.insertPlayer(cloudPlayer);
//        cloudPlayer.id = await RepositoryServicePlayers.insertPlayer(cloudPlayer);
        players.add(cloudPlayer);
      }
    }
    for(final player in players) {
      print("jj  " + player.name  + "  ${player.battingOrder}");
    }
  }

  static loadTeams(String sKID) async {
    print("getTeams  $sKID");
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("leagues/$sKID/teams")
        .getDocuments();

    for (DocumentSnapshot documentSnapshot in querySnapshot.documents) {
      String id = documentSnapshot.documentID;
      Team team = TeamUtils.fromFirestore(documentSnapshot.data, sKID, id);
      database.teamDao.insertTeam(team);
//      team.id = await RepositoryServiceTeams.insertTeam(team);
    }
  }

  static Future<void> addPlayer(String sKID, Player player) async {
    print("addplayer  ${player.name}");
    return Firestore.instance
        .collection("leagues/$sKID/players")
        .document(player.firestoreID)
        .setData(PlayerUtils.toFirestore(player));
  }
}
