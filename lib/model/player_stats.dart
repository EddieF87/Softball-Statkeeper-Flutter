import 'package:meta/meta.dart';

class PlayerStats {
  double id;
  String firestoreID;
  String teamFirestoreID;
  String name;
  String team;
  int games;
  int rbi;
  int runs;
  int singles;
  int doubles;
  int triples;
  int hrs;
  int outs;
  int walks;
  int sacFlies;
  int stolenBases;
  int strikeOuts;
  int hbp;
  int gender;
  int rOE;

  PlayerStats({
    @required this.id,
    @required this.firestoreID,
    @required this.name,
    this.team = "Free Agent",
    this.games = 0,
    this.rbi = 0,
    this.runs = 0,
    this.singles = 0,
    this.doubles = 0,
    this.triples = 0,
    this.hrs = 0,
    this.outs = 0,
    this.walks = 0,
    this.sacFlies = 0,
    this.stolenBases = 0,
    this.strikeOuts = 0,
    this.hbp = 0,
    this.gender = 0,
    this.rOE = 0,
  })  : assert(id != null),
        assert(firestoreID != null),
        assert(name != null);

  Map<String, dynamic> toJson() => {
    "id" : this.id,
    "firestoreID" : this.firestoreID,
    "teamFirestoreID" : this.teamFirestoreID,
    "name" : this.name,
    "team" : this.team,
    "games" : this.games,
    "rbi" : this.rbi,
    "runs" : this.runs,
    "singles" : this.singles,
    "doubles" : this.doubles,
    "triples" : this.triples,
    "hrs" : this.hrs,
    "outs" : this.outs,
    "walks" : this.walks,
    "sacFlies" : this.sacFlies,
    "stolenBases" : this.stolenBases,
    "strikeOuts" : this.strikeOuts,
    "hbp" : this.hbp,
    "gender" : this.gender,
    "rOE" : this.rOE,
  };

  Map<String, int> toStatsMap() => {
    "G" : this.games,
    "RBI" : this.rbi,
    "Runs" : this.runs,
    "1B" : this.singles,
    "2B" : this.doubles,
    "3B" : this.triples,
    "HR" : this.hrs,
    "Out" : this.outs,
    "BB" : this.walks,
    "SF" : this.sacFlies,
    "SB" : this.stolenBases,
    "K" : this.strikeOuts,
    "HBP" : this.hbp,
    "ROE" : this.rOE,
  };
}
