import 'package:flutter/material.dart';
import 'package:sleekstats_flutter_statkeeper/model/statkeeper.dart';

class StatKeeperLabel extends StatelessWidget {
  final StatKeeper statKeeper;

  const StatKeeperLabel({Key key, @required this.statKeeper})
      : assert(statKeeper != null),
        super(key: key);

  IconData _chooseIcon() {
    switch (statKeeper.type) {
      case SKType.PLAYER:
        return Icons.person;
      case SKType.TEAM:
        return Icons.people;
      case SKType.LEAGUE:
        return Icons.cake;
      default:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: InkWell(
        onTap: () => print("name = ${statKeeper.name}"),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                child: Icon(
                  _chooseIcon(),
                  size: 48.0,
                ),
                padding: EdgeInsets.only(right: 32.0),
              ),
              Text(
                statKeeper.name,
//            textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
