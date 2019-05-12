import 'package:mobx/mobx.dart';
import 'package:sleekstats_flutter_statkeeper/database/repository_service_players.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';
part 'player_store.g.dart';

class PlayerStore = _PlayerStore with _$PlayerStore;

// The store-class
abstract class _PlayerStore implements Store {
  @observable
  Player player;

  @observable
  String statToUpdate;

  @action
  setStatToUpdate(String stat) {
    statToUpdate = stat;
  }

  @action
  set setPlayer(Player newPlayer) => player = newPlayer;

  @action
  Future setPlayerFromDB(
      String statKeeperFirestoreID, String firestoreID) async {
    player = await RepositoryServicePlayers.getPlayer(
        statKeeperFirestoreID, firestoreID);
  }

  @action
  Future<Player> getPlayerFromDB(
      String statKeeperFirestoreID, String firestoreID) async {
    return player = await RepositoryServicePlayers.getPlayer(
        statKeeperFirestoreID, firestoreID);
  }

  @action
  Future updateCountingStat(int amount) async {
    print("updateCountingStat");
    if (statToUpdate != null &&
        Player.CHANGEABLE_LABELS.contains(statToUpdate)) {
      switch (statToUpdate) {
        case Player.LABEL_R:
          player.runs += amount;
          if(player.runs < 0) player.runs = 0;
          break;
        case Player.LABEL_RBI:
          player.rbi += amount;
          if(player.rbi < 0) player.rbi = 0;
          break;
        case Player.LABEL_1B:
          player.singles += amount;
          if(player.singles < 0) player.singles = 0;
          break;
        case Player.LABEL_2B:
          player.doubles += amount;
          if(player.doubles < 0) player.doubles = 0;
          break;
        case Player.LABEL_3B:
          player.triples += amount;
          if(player.triples < 0) player.triples = 0;
          break;
        case Player.LABEL_HR:
          player.hrs += amount;
          if(player.hrs < 0) player.hrs = 0;
          break;
        case Player.LABEL_OUT:
          player.outs += amount;
          if(player.outs < 0) player.outs = 0;
          break;
        case Player.LABEL_ROE:
          player.reachedOnErrors += amount;
          if(player.reachedOnErrors < 0) player.reachedOnErrors = 0;
          break;
        case Player.LABEL_SF:
          player.sacFlies += amount;
          if(player.sacFlies < 0) player.sacFlies = 0;
          break;
        case Player.LABEL_BB:
          player.walks += amount;
          if(player.walks < 0) player.walks = 0;
          break;
        case Player.LABEL_SB:
          player.stolenBases += amount;
          if(player.stolenBases < 0) player.stolenBases = 0;
          break;
        case Player.LABEL_G:
          player.games += amount;
          if(player.games < 0) player.games = 0;
          break;
        case Player.LABEL_HBP:
          player.hbp += amount;
          if(player.hbp < 0) player.hbp = 0;
          break;
        case Player.LABEL_K:
          player.strikeOuts += amount;
          if(player.strikeOuts < 0) player.strikeOuts = 0;
          break;
      }
    }
    await RepositoryServicePlayers.updatePlayer(player);
    player = player;
  }
}
