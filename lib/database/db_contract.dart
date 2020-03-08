class DBContract{

  //DB Tables
  static const TABLE_STATKEEPERS = "statkeepers";
  static const TABLE_TEAMS = "teams";
  static const TABLE_PLAYERS = "players";
  static const TABLE_PLAYS = "plays";

  //ID Columns
  static const ID = "id";
  static const FIRESTORE_ID = "firestoreID";
  static const TEAM_FIRESTORE_ID = "teamfirestoreid";
  static const STATKEEPER_FIRESTORE_ID = "statkeeperFirestoreID";

  //Player Table Columns
  static const NAME = "name";
  static const TEAM = "team";
  static const GENDER = "gender";
  static const GAMES = "games";
  static const RUNS = "runs";
  static const RBI = "rbis";
  static const SINGLES = "singles";
  static const DOUBLES = "doubles";
  static const TRIPLES = "triples";
  static const HRS = "hrs";
  static const WALKS = "walks";
  static const OUTS = "outs";
  static const SAC_FLIES = "sacFlies";
  static const REACHED_ON_ERRORS = "reachedOnErrors";
  static const STRIKEOUTS = "strikeouts";
  static const STOLEN_BASES = "stolenBases";
  static const HBP = "hbp";
  static const BATTING_ORDER = "battingOrder";

  //Team Table Columns
  static const WINS = "wins";
  static const LOSSES = "losses";
  static const TIES = "ties";
  static const RUNS_SCORED = "totalRunsScored";
  static const RUNS_ALLOWED = "totalRunsAllowed";



  //StatKeeper Table Columns
  static const UPDATE = "update";
  static const TYPE = "type";
  static const LEVEL = "level";


  //GameStats Table Columns
  static const PLAY_NUMBER = "number";
  static const PLAY = "play";
  static const BATTER = "batter";
  static const ON_DECK = "ondeck";
  static const BASE1 = "base_1";
  static const BASE2 = "base_2";
  static const BASE3 = "base_3";
  static const AWAY_RUNS = "awayteam_runs";
  static const HOME_RUNS = "hometeam_runs";
  static const RUN1 = "run1";
  static const RUN2 = "run2";
  static const RUN3 = "run3";
  static const RUN4 = "run4";
  static const INNING_CHANGED = "inn_changed";
  static const INNINGS = "total_inns";
  static const INNING_RUNS = "inn_runs";
}