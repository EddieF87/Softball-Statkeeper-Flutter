import 'package:meta/meta.dart';
import 'package:sleekstats_flutter_statkeeper/database/db_contract.dart';

class StatKeeper {
  int id;
  String firestoreID;
  String name;
  int type;
  int level;

  ///Levels of user access/authority w/r to StatKeepers
  static const LEVEL_REMOVE_USER = 0;
  static const LEVEL_VIEW_ONLY = 1;
  static const LEVEL_VIEW_WRITE = 2;
  static const LEVEL_ADMIN = 3;
  static const LEVEL_CREATOR = 4;

  static const TYPE_PLAYER = 0;
  static const TYPE_TEAM = 1;
  static const TYPE_LEAGUE = 2;

  StatKeeper({
    @required this.firestoreID,
    @required this.name,
    @required this.type,
    this.level = LEVEL_VIEW_ONLY,
  })  : assert(firestoreID != null),
        assert(name != null),
        assert(type != null),
        assert(level != null);

  StatKeeper.fromJson(Map<String, dynamic> json) {
    this.firestoreID = json[DBContract.FIRESTORE_ID];
    this.name = json[DBContract.NAME];
    this.type = json[DBContract.TYPE];
    this.level = json[DBContract.LEVEL];
  }
}