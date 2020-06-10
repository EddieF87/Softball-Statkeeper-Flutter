import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';

class TeamUtils {
  static const String LABEL_TEAM = "Team";
  static const String LABEL_W = "W";
  static const String LABEL_L = "L";
  static const String LABEL_T = "T";
  static const String LABEL_WINPCT = "WinPct";
  static const String LABEL_RS = "RS";
  static const String LABEL_RA = "RA";
  static const String LABEL_RUNDIFF = "Diff";

  static Team fromJson(Map<String, dynamic> json) => new Team(
        id: json[DBContract.ID],
        firestoreID: json[DBContract.FIRESTORE_ID],
        statkeeperFirestoreID: json[DBContract.STATKEEPER_FIRESTORE_ID],
        name: json[DBContract.NAME],
        wins: json[DBContract.WINS],
        losses: json[DBContract.LOSSES],
        ties: json[DBContract.TIES],
        totalRunsScored: json[DBContract.RUNS_SCORED],
        totalRunsAllowed: json[DBContract.RUNS_ALLOWED],
      );

  static Team fromFirestore(
          Map<String, dynamic> json, String sKFireID, String fireID) =>
      new Team(
        firestoreID: fireID,
        statkeeperFirestoreID: sKFireID,
        name: json[DBContract.NAME],
        wins: json[DBContract.WINS] ?? 0,
        losses: json[DBContract.LOSSES] ?? 0,
        ties: json[DBContract.TIES] ?? 0,
        totalRunsScored: json[DBContract.RUNS_SCORED] ?? 0,
        totalRunsAllowed: json[DBContract.RUNS_ALLOWED] ?? 0,
      );

  static Comparator<Team> nameComparator() =>
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase());

  static Comparator<Team> winComparator() => (a, b) => b.wins.compareTo(a.wins);

  static Comparator<Team> lossComparator() =>
      (a, b) => a.losses.compareTo(b.losses);

  static Comparator<Team> tieComparator() => (a, b) => b.ties.compareTo(a.ties);

  static Comparator<Team> winPctComparator() =>
      (a, b) => b.getWinPct().compareTo(a.getWinPct());

  static Comparator<Team> runsScoredComparator() =>
      (a, b) => b.totalRunsScored.compareTo(a.totalRunsScored);

  static Comparator<Team> runsAllowedComparator() =>
      (a, b) => b.totalRunsAllowed.compareTo(a.totalRunsAllowed);

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

extension ExtendedTeam on Team {
  double getWinPct() {
    int games = wins + losses + ties;
    if (games == 0) {
      return -1;
    } else {
      return wins / games;
    }
  }

  int getRunDiff() => totalRunsScored - totalRunsAllowed;
}
