import 'package:meta/meta.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/model/player.dart';

class Team {
  int id;
  String fireID;
  String statkeeperFireID;
  String name;
  int wins;
  int losses;
  int ties;
  int runsScored;
  int runsAllowed;
  final List<Player> players = [];

  static const String LABEL_TEAM = "Team";
  static const String LABEL_W = "W";
  static const String LABEL_L = "L";
  static const String LABEL_T = "T";
  static const String LABEL_WINPCT = "WinPct";
  static const String LABEL_RS = "RS";
  static const String LABEL_RA = "RA";
  static const String LABEL_RUNDIFF = "Diff";

  Team({
    this.id,
    @required this.fireID,
    @required this.name,
    this.statkeeperFireID,
    this.wins = 0,
    this.losses = 0,
    this.ties = 0,
    this.runsScored = 0,
    this.runsAllowed = 0,
  })  : assert(fireID != null),
        assert(name != null);

  Team.fromJson(Map<String, dynamic> json) {
    this.id = json[DBContract.ID];
    this.fireID = json[DBContract.FIRESTORE_ID];
    this.statkeeperFireID = json[DBContract.STATKEEPER_FIRESTORE_ID];
    this.name = json[DBContract.NAME];
    this.wins = json[DBContract.WINS];
    this.losses = json[DBContract.LOSSES];
    this.ties = json[DBContract.TIES];
    this.runsScored = json[DBContract.RUNS_SCORED];
    this.runsAllowed = json[DBContract.RUNS_ALLOWED];
  }

  double getWinPct() {
    int games = this.wins + this.losses + this.ties;
    if (games == 0) {
      return -1;
    } else {
      return this.wins / games;
    }
  }

  int getRunDiff() => runsScored - runsAllowed;

  @override
  String toString() {
    return "Team: $fireID  $statkeeperFireID\n$name  $wins-$losses-$ties   $runsScored  $runsAllowed";
  }

  static Comparator<Team> nameComparator() =>
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase());

  static Comparator<Team> winComparator() => (a, b) => b.wins.compareTo(a.wins);

  static Comparator<Team> lossComparator() =>
      (a, b) => a.losses.compareTo(b.losses);

  static Comparator<Team> tieComparator() => (a, b) => b.ties.compareTo(a.ties);

  static Comparator<Team> winPctComparator() =>
      (a, b) => b.getWinPct().compareTo(a.getWinPct());

  static Comparator<Team> runsScoredComparator() =>
      (a, b) => b.runsScored.compareTo(a.runsScored);

  static Comparator<Team> runsAllowedComparator() =>
      (a, b) => b.runsAllowed.compareTo(a.runsAllowed);

  static Comparator<Team> runDifferentialComparator() =>
      (a, b) => b.getRunDiff().compareTo(a.getRunDiff());

  static Map<String, Comparator<Team>> toComparatorMap() => {
        LABEL_TEAM: nameComparator(),
        LABEL_W: winComparator(),
        LABEL_L: lossComparator(),
        LABEL_T: tieComparator(),
        LABEL_WINPCT: winPctComparator(),
        LABEL_RS: runsScoredComparator(),
        LABEL_RA: runsAllowedComparator(),
        LABEL_RUNDIFF: runDifferentialComparator(),
      };
}
