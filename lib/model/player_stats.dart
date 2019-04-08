import 'package:meta/meta.dart';

class PlayerStats {
  BigInt id;
  String firestoreID;
  String teamFirestoreID;
  String name;
  String team;
  int rbi = 0;
  int runs = 0;
  int singles = 0;
  int doubles = 0;
  int triples = 0;
  int hrs = 0;
  int outs = 0;
  int walks = 0;
  int sacFlies = 0;
  int stolenBases = 0;
  int strikeOuts = 0;
  int hbp = 0;
  int games = 0;
  int gender = 0;
  int rOE = 0;

  PlayerStats({
    @required this.id,
    @required this.firestoreID,
    @required this.name,
    this.team,
    this.rbi,
    this.runs,
    this.singles,
    this.doubles,
    this.triples,
    this.hrs,
    this.outs,
    this.walks,
    this.sacFlies,
    this.stolenBases,
    this.strikeOuts,
    this.hbp,
    this.games,
    this.gender,
    this.rOE,
  })  : assert(id != null),
        assert(firestoreID != null),
        assert(name != null);
}
