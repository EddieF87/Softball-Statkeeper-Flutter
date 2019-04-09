import 'package:meta/meta.dart';

class StatKeeper {
  final String id;
  final String name;
  final SKType type;
  final int level;



  const StatKeeper({
    @required this.id,
    @required this.name,
    @required this.type,
    @required this.level,
  })  : assert(id != null),
        assert(name != null),
        assert(type != null),
        assert(level != null);

}


enum SKType {
  PLAYER,
  TEAM,
  LEAGUE,
}
