import 'package:moor_flutter/moor_flutter.dart';
import 'moor_tables.dart';

MyDatabase constructDb() {
  return MyDatabase(
      FlutterQueryExecutor.inDatabaseFolder(path: 'sleekstats.sqlite'));
}
