import 'package:flutter/material.dart';

abstract class StatKeeperRoute extends StatefulWidget {
  StatKeeperRoute({Key key, this.title}) : super(key: key);
  final String title;
}