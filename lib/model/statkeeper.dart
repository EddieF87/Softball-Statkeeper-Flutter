import 'package:meta/meta.dart';

class StatKeeper {
  final String id;
  final String name;
  final SKType type;
  final int level;

  ///Levels of user access/authority w/r to StatKeepers
  static const LEVEL_REMOVE_USER = 0;
  static const LEVEL_VIEW_ONLY = 1;
  static const LEVEL_VIEW_WRITE = 2;
  static const LEVEL_ADMIN = 3;
  static const LEVEL_CREATOR = 4;

  const StatKeeper({
    @required this.id,
    @required this.name,
    @required this.type,
    this.level = LEVEL_VIEW_ONLY,
  })  : assert(id != null),
        assert(name != null),
        assert(type != null),
        assert(level != null);
}

///Types of StatKeepers
enum SKType {
  PLAYER,
  TEAM,
  LEAGUE,
}