class DBContract{

  //DB Tables
  static const TABLE_STATKEEPERS = "statkeepers";
  static const TABLE_TEAMS = "teams";
  static const TABLE_PLAYERS = "players";
  static const TABLE_PLAYS = "plays";

  //ID Columns
  static const ID = "id";
  static const FIRESTORE_ID = "firestoreID";
  static const TEAM_FIRESTORE_ID = "teamFirestoreID";
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
  static const OUTS = "out";
  static const SAC_FLIES = "sf";
  static const REACHED_ON_ERRORS = "reachedOnErrors";
  static const STRIKEOUTS = "strikeOuts";
  static const STOLEN_BASES = "stolenBases";
  static const HBP = "hbp";

  //Team Table Columns
  static const WINS = "wins";
  static const LOSSES = "losses";
  static const TIES = "ties";
  static const RUNS_SCORED = "runs_scored";
  static const RUNS_ALLOWED = "runs_allowed";



  //StatKeeper Table Columns
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