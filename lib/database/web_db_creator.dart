import 'package:moor/moor_web.dart';
import 'package:sleekstats_flutter_statkeeper/database/moor_tables.dart';

MyDatabase constructDb() {
  return MyDatabase(WebDatabase('db'));
}
